import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/accounts/blocs/blocs.dart';
import 'package:comecsoft/accounts/models/models.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/accounts/app_state.dart';
import 'package:comecsoft/common/constants.dart' as constants;

class SSOSignInPage extends StatefulWidget {
  SSOSignInPage({ Key? key }) : super(key: key);

  @override
  SSOSignInPageState createState() => SSOSignInPageState();
}

class SSOSignInPageState extends State<SSOSignInPage> {
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  S? _s;

  @override
  Widget build(BuildContext context){
    _s = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: BlocListener<SSOSignInBloc, SSOSignInState>(
          listener: (context, state){
            if (state is SSOSignInFailure || state is SSOSignInNetworkFailure){
              // set token & refresh to null and retry login.
              AppState.of(context).setSSOToken(null);
              AppState.of(context).setSSORefreshToken(null);
              showAlertDialog(context,
                _s!.loginFailed,
                (state is SSOSignInFailure) ? state.comment : '',
                yes: _s!.commonOK,
                yesOnPressed: () => Navigator.pop(context),
              );
            }else if (state is SSOSignInSuccess){
              AppState.of(context).setUser(state.user);
              AppState.of(context).setSSOToken(state.token);
              AppState.of(context).setSSORefreshToken(state.refreshToken);
              //AppState.of(context).setAppToken(state.appToken);
              AppState.of(context).setProvider(state.provider);

              // go to home page
              Navigator.of(context).pushReplacementNamed(getSubAppHomepage(context, constants.defaultSubApp)!);
            }
          },
          child: ProgressHUD(
            key: _progressHUDKey,
            backgroundColor: AppColor.color90,
            borderColor: AppColor.color90,
            textStyle: TextStyle(color: AppColor.color101, fontSize: 14.0),
            indicatorColor: AppColor.color502,
            child: SingleChildScrollView(
              child: Container(
                height: 1.sh,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/signin.png"),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 430.h,),
                    Center(
                      child: Container(
                        color: AppColor.color90,
                        child: LoginWidget(
                          onLogIn: _onLogIn,
                          agreedTermPrivacy: AppState.of(context).agreedTermPrivacy,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLogIn(LogInEvent event, LogInInfo info){
    if(event == LogInEvent.LogInEvent_started){
      _progressHUDKey.currentState!.show();
    }else{
      _progressHUDKey.currentState!.dismiss();
    }

    if(event == LogInEvent.LogInEvent_fail){
      String? message;
      logger.d('${this.runtimeType} _onLogIn LogInEvent_fail');

      if (info.provider == LogIn_Google)
        message = sprintf('%s %s', [_s!.loginGoogle, _s!.loginAuthError]);
      else if(info.provider == LogIn_Facebook)
        message = sprintf('%s %s', [_s!.loginFacebook, _s!.loginAuthError]);

      showAlertDialog(context,
        message!,
        null,
        yes: _s!.commonOK,
        yesOnPressed: () => Navigator.pop(context),
      );
    }else if(event == LogInEvent.LogInEvent_success){
      logger.d('${this.runtimeType} _onLogIn LogInEvent_success ${info.provider}');

      // set agreed term & policy to true
      AppState.of(context).setAgreedTermPrivacy(true);

      if (info.provider == LogIn_Google){
        // LogInInfo info = LogInInfo(provider: LogIn_Google, email: 'test0@example.com', name: 'kkk', photoUrl: null, idToken: 'adfsd' );
        User user = User(name: info.name!, email: info.email!, photoUrl: info.photoUrl);
        BlocProvider.of<SSOSignInBloc>(context).add(SSOSignInAppServer(
          email: info.email!,
          token: info.idToken,
          provider: info.provider,
          user: user,
        ));
      }else if (info.provider == LogIn_Facebook){
        User user = User(name: info.name!, email: info.email!, photoUrl: info.photoUrl);
        BlocProvider.of<SSOSignInBloc>(context).add(SSOSignInAppServer(
          email: info.email!,
          token: info.idToken,
          provider: info.provider,
          user: user,
        ));
      }
    }
  }

  static Future<bool> signinSilently(context, provider) async{
    LogInInfo? logInInfo;

    try {
      logInInfo = await LoginWidgetState.signInSilently(provider);
      if ((logInInfo?.email?.isEmpty ?? true) || (logInInfo?.idToken?.isEmpty ?? true)){
        logger.d('signinSilently provider login failed');
        return false;
      }
      logger.d('signinSilently provider login success');

      return true;

      /*
      dynamic res = await getAppToken(context);
      if (res == true || res == false) return res;

      // if getAppToken return null, refreshToken needed
      res = await getRefreshToken(context);
      if (res == false) return res;

      // if refreshToken success, try getAppToken again.
      res = await getAppToken(context);
      if (res == true) return res;
      else return false;
       */
    }catch(_){
      return false;
    }
  }

  /*
  get app_token from sso server.
  return true if successfully getting app_token.
         false if failed getting app_token.
         null if refreshToken needed.
   */
  /*
  static Future<dynamic> getAppToken(context) async{
    final UserRepository userRepository = UserRepository();

    GetAppTokenResponse getAppTokenResponse = await userRepository.getAppToken(AppState.of(context).ssoToken);

    if (getAppTokenResponse == null){
      logger.d('getAppToken failure}');
      return false;
    }

    if (getAppTokenResponse.statusCode == 401){
      logger.d('refreshToken needed}');
      return null;
    }else if (getAppTokenResponse.statusCode != 200){
      logger.d('getAppToken failure}');
      return false;
    }else{
      logger.d('getAppToken success}');
      AppState.of(context).setAppToken(getAppTokenResponse.appToken);
      return true;
    }
  }
   */

  /*
  refresh ssoToken from sso server.
  return true if successfully getting ssoToken.
         false if failed getting ssoToken.
   */
  /*
  static Future<dynamic> getRefreshToken(context) async{
    final UserRepository userRepository = UserRepository();

    RefreshTokenResponse refreshTokenResponse = await userRepository.refreshToken(AppState.of(context).ssoRefreshToken,
        AppState.of(context).ssoToken);

    if (refreshTokenResponse == null || refreshTokenResponse.statusCode != 200){
      logger.d('get SSOToken failure}');
      return false;
    }else{
      logger.d('get SSOToken success}');
      AppState.of(context).setSSOToken(refreshTokenResponse.token);
      return true;
    }
  }
   */
}