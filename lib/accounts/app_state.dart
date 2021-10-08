import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:comecsoft/accounts/models/models.dart';
import 'package:comecsoft/utils/utils.dart';


final String _subAppNameKey = "sub_app_name_key";
final String _userKey = "user_key";
final String _providerKey = "provider_key";
final String _providerTokenKey = "provider_token_key";
final String _appTokenKey = "app_token_key";
final String _appRefreshTokenKey = "app_refresh_token_key";
final String _pushTokenKey = "push_token_key";
final String _agreedTermPrivacyKey = "agreed_term_privacy_key";

class AppState {
  LocalStorage _localStorage = LocalStorage();
  LocalStorage get localStorage => _localStorage;

  User? _user;
  String? _provider;
  String? _providerToken;
  String? _defaultSubAppName;
  String? _ssoToken;
  String? _ssoRefreshToken;
  // String _appToken;
  String? _pushToken;
  dynamic _subAppFactories;
  late PackageInfo _packageInfo;
  late bool _agreedTermPrivacy;

  User? get user => _user;
  String? get provider => _provider;
  String? get providerToken => _providerToken;
  String? get defaultSubAppName => _defaultSubAppName;
  String? get ssoToken => _ssoToken;
  String? get ssoRefreshToken => _ssoRefreshToken;
  String? get pushToken => _pushToken;
  PackageInfo get packageInfo => _packageInfo;
  bool get agreedTermPrivacy => _agreedTermPrivacy;
  // String get appToken => _appToken;
  dynamic get subAppFactories => _subAppFactories;

  AppState(this._subAppFactories);

  // add listen in Provider.of<AppState>
  // refer to https://stackoverflow.com/questions/59590673/flutter-app-crash-after-converting-provider-3-to-4
  static AppState of(BuildContext context) => RepositoryProvider.of<AppState>(context);

  Future init() async {
    await _localStorage.init();

    try{
      _user = User.fromJson(jsonDecode(_localStorage.getString(_userKey)!));
    }catch (error){
      _user = null;
    }

    _defaultSubAppName = _localStorage.getString(_subAppNameKey);
    _provider = _localStorage.getString(_providerKey);
    _ssoToken = await _localStorage.getSecureString(_appTokenKey);
    _ssoRefreshToken = await _localStorage.getSecureString(_appRefreshTokenKey);
    _pushToken = await _localStorage.getSecureString(_pushTokenKey);
    _providerToken = await _localStorage.getSecureString(_providerTokenKey);
    _agreedTermPrivacy = _localStorage.getBool(_agreedTermPrivacyKey);

    // get package info
    _packageInfo = await PackageInfo.fromPlatform();

    return;
  }

  void setUser(User? user) async{
    this._user = user;
    await _localStorage.setString(_userKey, jsonEncode(user));
  }

  void setDefaultSubAppName(String? appName) async{
    this._defaultSubAppName = appName;
    await _localStorage.setString(_subAppNameKey, appName);
  }

  void setProvider(String? provider) async{
    this._provider = provider;
    await _localStorage.setString(_providerKey, provider);
  }

  void setSSOToken(String? token) async{
    this._ssoToken = token;
    await _localStorage.setSecureString(_appTokenKey, token);
  }

  void setSSORefreshToken(String? refresh) async{
    this._ssoRefreshToken = refresh;
    await _localStorage.setSecureString(_appRefreshTokenKey, refresh);
  }

  /*
  void setAppToken(String token) async{
    this._appToken = token;
    // appToken not saved in secureStorage
  }
  */

  void setPushToken(String? pushToken) async{
    this._pushToken = pushToken;
    await _localStorage.setSecureString(_pushTokenKey, pushToken);
  }

  void setProviderToken(String? providerToken) async{
    this._providerToken = providerToken;
    await _localStorage.setSecureString(_providerTokenKey, providerToken);
  }

  void setAgreedTermPrivacy(bool agreed) async{
    this._agreedTermPrivacy = agreed;
    await _localStorage.setBool(_agreedTermPrivacyKey, agreed);
  }
}