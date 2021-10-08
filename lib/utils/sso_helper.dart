import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';

import 'package:comecsoft/accounts/models/models.dart';
import 'package:comecsoft/accounts/app_state.dart';
import 'package:comecsoft/accounts/repository/repository.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';


/*
SSO related help functions
USE these functions below to access data & function owned by sso
 */
Future initAppStates(context) async{
  logger.d('initAppStates');

  //initialize Main AppState in Whattobuy app
  await AppState.of(context).init();

  //initialize FSAppState in Whattobuy app
  await FSAppState.of(context).init(context);
}

// get user
User? getUser(context){
  return AppState.of(context).user;
}

// set push token
void setPushToken(context, token){
  AppState.of(context).setPushToken(token);
}

// get push token
String? getPushToken(context){
  return AppState.of(context).pushToken;
}

// set sso token
void setSSOToken(context, token){
  AppState.of(context).setSSOToken(token);
}

// get sso token
String? getSSOToken(context){
  return AppState.of(context).ssoToken;
}

// set sso refresh token
void setSSORefreshToken(context, token){
  AppState.of(context).setSSORefreshToken(token);
}

// get sso refresh token
String? getSSORefreshToken(context){
  return AppState.of(context).ssoRefreshToken;
}

// get sub app name's abbreviation
String? getSubAppAbbr(context, appName){
  return AppState.of(context).subAppFactories[appName]['abbr'];
}

// get sub app home
String? getSubAppHomepage(context, appName){
  return AppState.of(context).subAppFactories[appName]['homepage'];
}

// get sso signin page
String? getSSOSigninpage(context){
  return AppState.of(context).subAppFactories[constants.ssoApp]['signin'];
}

// get user
PackageInfo getPackageInfo(context){
  return AppState.of(context).packageInfo;
}

Future<RefreshTokenResponse?> refreshToken(refresh, token) async{
  final SSORepository ssoRepository = SSORepository();

  RefreshTokenResponse? refreshTokenResponse = await ssoRepository.refreshToken(refresh, token);

  return refreshTokenResponse;
}

Future<SignOutResponse?> signOut(token, refresh) async{
  final SSORepository ssoRepository = SSORepository();

  SignOutResponse? signOutResponse = await ssoRepository.signOut(token, refresh);

  return signOutResponse;
}

Future<DeleteUserResponse?> deleteUser(token) async{
  final SSORepository ssoRepository = SSORepository();

  DeleteUserResponse? deleteUserResponse = await ssoRepository.deleteUser(token);

  return deleteUserResponse;
}

void signOutCleanup(context) async{
  AppState.of(context).setUser(null);
  AppState.of(context).setDefaultSubAppName(null);
  AppState.of(context).setProvider(null);
  AppState.of(context).setSSOToken(null);
  AppState.of(context).setSSORefreshToken(null);
  AppState.of(context).setPushToken(null);
  AppState.of(context).setProviderToken(null);

  // log out all provider
  LoginWidgetState.signOutSilently();
}
