import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/accounts/app_state.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/accounts/pages/pages.dart';
import 'package:comecsoft/components/flutter_progress_hud.dart';
import 'package:comecsoft/components/components.dart';

enum splashState {
  locationPermissionPermanentlyDenied,
  locationPermissionDenied,
  loginRequired,
  goHomePage,
}

class SplashPage extends StatefulWidget {
  SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    if (_loading == false){
      initializeLbsFaApp().then((value) => handleSplashState(value));
      _loading = true;
    }

    return Scaffold(
      backgroundColor: AppColor.color201,
      body: SafeArea(
        child: ProgressHUD(
          key: _progressHUDKey,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash.png"),
                    fit: BoxFit.cover
                )
            ),
            // child: FSIntroText(context),
          ),
        ),
      ),
    );
  }

  Future initializeLbsFaApp() async{
    logger.d('${this.runtimeType} initializeLbsFaApp');

    //1. load environment variable
    if(kReleaseMode){
      print('kReleaseMode');
      await DotEnv.load(fileName: '.private/prod/.env');
      //await DotEnv.load(fileName: '.private/debug/.env');
    }
    else{
      print('debugMode');
      //await DotEnv.load(fileName: '.private/prod/.env');
      await DotEnv.load(fileName: '.private/debug/.env');
    }

    //2. location permission check
    //refer to https://pub.dev/packages/permission_handler
    //To use this plugin add permission in AndroidManifest.xml
    PermissionStatus locationPermissionStatus = await Permission.location.request();
    if (locationPermissionStatus == PermissionStatus.granted) {
      logger.d('${this.runtimeType} location permission granted');
    }else if (locationPermissionStatus == PermissionStatus.permanentlyDenied){
      logger.d('${this.runtimeType} location permission permanentlyDenied');
      return(splashState.locationPermissionPermanentlyDenied);
    }else {
      logger.d('${this.runtimeType} location permission denied');
      return(splashState.locationPermissionDenied);
    }

    //3. initialize AppState
    await initAppStates(context);
    if (AppState.of(context).defaultSubAppName == null){
      logger.d('${this.runtimeType} current App is null');
      AppState.of(context).setDefaultSubAppName(constants.defaultSubApp);
    }

    //4. get AppToken
    if (AppState.of(context).ssoToken == null || AppState.of(context).ssoRefreshToken == null ||
        AppState.of(context).user == null ||
        AppState.of(context).provider == null
    ){
      logger.d('${this.runtimeType} login required');
      return(splashState.loginRequired);
    }

    //5. if already logged in, login silently without UI
    //if(await constants.subAppList[AppState.of(context).subAppName]['loginSilently'](context, AppState.of(context).provider) == false)
    if(await SSOSignInPageState.signinSilently(context, AppState.of(context).provider) == false)
      return(splashState.loginRequired);

    return splashState.goHomePage;
  }

  void handleSplashState(state){
    S? _s = S.of(context);

    switch(state){
      case splashState.locationPermissionPermanentlyDenied:
      case splashState.locationPermissionDenied:
        showAlertDialog(context,
          sprintf("%s %s", [_s.commonLocation, _s.commonPermissionDenied]),
          sprintf("%s\n%s", [_s.commonApprovePermission(_s.commonLocation), _s.commonApprovePermissionDetail(_s.commonLocation)]),
          yes: 'OK',
          yesOnPressed: (){
            AppSettings.openAppSettings();
            closeApp();
          },
          no: 'NO',
          noOnPressed: () => closeApp(),
        );
        break;

      case splashState.loginRequired:
        Navigator.of(context).pushReplacementNamed(getSSOSigninpage(context)!);
        break;

      case splashState.goHomePage:
        Navigator.of(context).pushReplacementNamed(getSubAppHomepage(context, constants.defaultSubApp)!);
        break;

      default:
        logger.d('${this.runtimeType} splash error ' + state.toString());
        showAlertDialog(context,
          _s.commonErrorInitialize,
          null,
          yes: 'OK',
          yesOnPressed: (){
            closeApp();
          },
        );
        break;
    }
  }
}