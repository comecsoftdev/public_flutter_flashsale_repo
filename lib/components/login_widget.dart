import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/utils/dialog_helper.dart';
import 'package:comecsoft/utils/logger.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/flashsale/pages/web_view.dart';

const String LogIn_Google = 'Google';
const String LogIn_Facebook = 'Facebook';


enum LogInEvent {
  LogInEvent_started,     // login started
  LogInEvent_success,     // login success
  LogInEvent_fail,        // login fail
  LogInEvent_cancel,      // login cancel
  LogInEvent_error,      // login error, if termsAndCondition isn't checked or privacyPolicy isn't checked
}

class LogInInfo{
  final String provider;
  final String? email;
  final String? name;
  final String? photoUrl;
  final String? idToken;

  LogInInfo({
    required this.provider,
    this.email,
    this.name,
    this.photoUrl,
    this.idToken,
  });
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    // 'https://www.googleapis.com/auth/contacts.readonly',
    //'https://www.googleapis.com/auth/user.phonenumbers.read'
  ],
);

class LoginWidget extends StatefulWidget {
  // callback for signIn
  final void Function(LogInEvent event, LogInInfo info)? onLogIn;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool agreedTermPrivacy;                  //Term & Privacy agreed

  LoginWidget({
    Key? key,
    required this.onLogIn,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.agreedTermPrivacy = false,
  }):   super(key: key);

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  S? _s;
  GlobalKey<LoginAgreeWidgetState> _over14yearsKey = new GlobalKey();
  GlobalKey<LoginAgreeWidgetState> _termsAndConditionKey = new GlobalKey();
  GlobalKey<LoginAgreeWidgetState> _privacyPolicyKey = new GlobalKey();
  GlobalKey<LoginAgreeWidgetState> _locationBasedTermsKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Center(
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        decoration: BoxDecoration(
            color: AppColor.color90,
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: <Widget>[
                LogInButton(
                  width: 263.w,
                  height: 48.h,
                  iconSize: 24.r,
                  icon: AssetImage("assets/images/google_icon.png"),
                  text: _s!.loginWithGoogle,
                  onTap: () => widget.onLogIn != null ? _onLogInButtonPressed(context, LogIn_Google) : null,
                ),
                SizedBox(height: 10.h),
                LogInButton(
                  width: 263.w,
                  height: 48.h,
                  iconSize: 24.r,
                  icon: AssetImage("assets/images/facebook_icon.png"),
                  text: _s!.loginWithFacebook,
                  onTap: () => widget.onLogIn != null ? _onLogInButtonPressed(context, LogIn_Facebook) : null,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginAgreeWidget(
                  key: _over14yearsKey,
                  checkBoxActiveColor: AppColor.color1011,
                  label: _s!.loginAgreeOver14Years,
                  fontColor: AppColor.color1012,
                  fontSize: 14.sp,
                  bold: true,
                  onTap: null,
                  value: widget.agreedTermPrivacy,
                ),
                SizedBox(height: 0.h),
                LoginAgreeWidget(
                  key: _termsAndConditionKey,
                  checkBoxActiveColor: AppColor.color1011,
                  label: _s!.loginAgreeTermsAndCondition,
                  fontColor: AppColor.color1012,
                  fontSize: 14.sp,
                  bold: true,
                  onTap: (label) => _onAgreementPressed(label),
                  value: widget.agreedTermPrivacy,
                ),
                SizedBox(height: 0.h),
                LoginAgreeWidget(
                  key: _privacyPolicyKey,
                  checkBoxActiveColor: AppColor.color1011,
                  label: _s!.loginAgreePrivacyPolicy,
                  fontColor: AppColor.color1012,
                  fontSize: 14.sp,
                  bold: true,
                  onTap: (label) => _onAgreementPressed(label),
                  value: widget.agreedTermPrivacy,
                ),
                SizedBox(height: 0.h),
                LoginAgreeWidget(
                  key: _locationBasedTermsKey,
                  checkBoxActiveColor: AppColor.color1011,
                  label: _s!.loginAgreeLocationBased,
                  fontColor: AppColor.color1012,
                  fontSize: 14.sp,
                  bold: true,
                  onTap: (label) => _onAgreementPressed(label),
                  value: widget.agreedTermPrivacy,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onAgreementPressed(label){
    if(label == _s!.loginAgreeTermsAndCondition){
      Map<String, dynamic> arguments = {
        'title': _s!.loginTermsService, 'initialHost': env['TERM_SERVICE']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
      };
      Navigator.of(context).pushNamed('fswebview', arguments: arguments);
    }else if(label == _s!.loginAgreePrivacyPolicy){
      Map<String, dynamic> arguments = {
        'title': _s!.loginPrivacyPolicy, 'initialHost': env['PRIVACY_POLICY']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
      };
      Navigator.of(context).pushNamed('fswebview', arguments: arguments);
    }else if(label == _s!.loginAgreeLocationBased){
      Map<String, dynamic> arguments = {
        'title': _s!.loginPrivacyPolicy, 'initialHost': env['LOCATION_BASE_TERM_SERVICE']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
      };
      Navigator.of(context).pushNamed('fswebview', arguments: arguments);
    }
  }

  void _onLogInButtonPressed(BuildContext context, String provider) async {
    widget.onLogIn!(LogInEvent.LogInEvent_started, LogInInfo(provider: LogIn_Google, ));

    // if termsAndCondition isn't checked or privacyPolicy isn't checked
    if (!_termsAndConditionKey.currentState!.getCheckBoxValue() || !_privacyPolicyKey.currentState!.getCheckBoxValue()
        || !_locationBasedTermsKey.currentState!.getCheckBoxValue() || !_over14yearsKey.currentState!.getCheckBoxValue()){
      showAlertDialog(context,
        _s!.loginAgreeTermPrivacy,
        null,
        yes: _s!.commonOK,
        yesOnPressed: (){
          widget.onLogIn!(LogInEvent.LogInEvent_error, LogInInfo(provider: LogIn_Google, ));
          Navigator.pop(context);
        },
      );
      return;
    }

    if (provider == LogIn_Google){
      // google SignIn - https://github.com/flutter/plugins/tree/master/packages/google_sign_in/google_sign_in
      // https://here4you.tistory.com/224
      // https://console.developers.google.com/에서 OAuth 2.0 클라이언트 ID의 서명 인증서 지문에 빌드 PC의 서명이 포함되어 있는지 확인
      // no idToken in googleSignInAuthentication. https://github.com/flutter/flutter/issues/12140
      // 1. add google-services.json
      // 2. add apply plugin: 'com.google.gms.google-services' in android/app/build.gradle
      // 3. add classpath 'com.google.gms:google-services:4.3.0' in android/build.gradle
      logger.d('${this.runtimeType} - provider google');
      final GoogleSignInAccount? googleSignInAccount = await (_googleSignIn.signIn());

      if (googleSignInAccount == null){
        widget.onLogIn!(LogInEvent.LogInEvent_cancel, LogInInfo(provider: LogIn_Google, ));
      }else{
        logger.d('${this.runtimeType} - provider google login success');
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        if(googleSignInAuthentication.idToken == null || googleSignInAuthentication.idToken == "") {
          logger.d('${this.runtimeType} - Fail SignIn Google');
          LogInInfo logInInfo = LogInInfo(provider: LogIn_Google, );
          widget.onLogIn!(LogInEvent.LogInEvent_fail, logInInfo);
        }else{
          logger.d('${this.runtimeType} - Success SignIn Google');
          LogInInfo logInInfo = LogInInfo(provider: LogIn_Google, email: googleSignInAccount.email,
              name: googleSignInAccount.displayName, photoUrl: googleSignInAccount.photoUrl, idToken: googleSignInAuthentication.idToken);
          widget.onLogIn!(LogInEvent.LogInEvent_success, logInInfo);
        }
      }
    }
    else if (provider == LogIn_Facebook){
      logger.d('${this.runtimeType} - start LogIn_Facebook');
      // https://pub.dev/packages/flutter_facebook_auth
      // Can't login with another account after logout https://github.com/facebook/facebook-ios-sdk/issues/1147

      // by default the login method has the next permissions ['email','public_profile']
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken =  result.accessToken!;

        final userData = await FacebookAuth.instance.getUserData();

        logger.d('${this.runtimeType} - FacebookLogin success');

        LogInInfo logInInfo = LogInInfo(provider: LogIn_Facebook, email: userData['email'].toString(),
            name: userData['name'].toString(), photoUrl: userData['picture']['data']['url'].toString(), idToken: accessToken.token);
        widget.onLogIn!(LogInEvent.LogInEvent_success, logInInfo);
      }else{
        logger.d('${this.runtimeType} - FacebookLoginStatus login failed');
        LogInInfo logInInfo = LogInInfo(provider: LogIn_Facebook, );
        widget.onLogIn!(LogInEvent.LogInEvent_fail, logInInfo);
      }
    }
  }

  // silent sign-in for provider
  static Future<LogInInfo?> signInSilently(String? provider) async{
    if (provider == LogIn_Google){
      final GoogleSignInAccount? googleSignInAccount = await (_googleSignIn.signInSilently());
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      if(googleSignInAuthentication.idToken == null || googleSignInAuthentication.idToken == "") {
        logger.d('signInSilently - Fail SignIn Google');
        LogInInfo logInInfo = LogInInfo(provider: LogIn_Google, );
        return logInInfo;
      }else{
        logger.d('signInSilently - Success SignIn Google');
        LogInInfo logInInfo = LogInInfo(provider: LogIn_Google, email: googleSignInAccount.email,
            name: googleSignInAccount.displayName, photoUrl: googleSignInAccount.photoUrl, idToken: googleSignInAuthentication.idToken);
        return logInInfo;
      }
    }else if (provider == LogIn_Facebook){
      final AccessToken? accessToken = await FacebookAuth.instance.accessToken;

      if(accessToken  != null){
        logger.d('signInSilently - Success SignIn Facebook');
        final userData = await FacebookAuth.instance.getUserData();

        LogInInfo logInInfo = LogInInfo(provider: LogIn_Facebook, email: userData['email'].toString(),
            name: userData['name'].toString(), photoUrl: userData['picture']['data']['url'].toString(), idToken: accessToken.token);
        return logInInfo;
      }else{
        logger.d('signInSilently - Fail SignIn Facebook');
        LogInInfo logInInfo = LogInInfo(provider: LogIn_Facebook, );
        return logInInfo;
      }
    }else return null;
  }

  static void signOutSilently() async{
    // google log out
    _googleSignIn.disconnect();

    // facebook log out
    await FacebookAuth.instance.logOut();
  }
}