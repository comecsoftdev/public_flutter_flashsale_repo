import 'package:dio/dio.dart';

import 'package:comecsoft/accounts/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';

class ApiProvider {
  static const String SIGN_IN = 'signin';
  static const String SIGN_OUT = 'signout';
  static const String REFRESH_TOKEN = 'refreshtoken';
  static const String DELETE_USER = 'deleteuser';

  Dio? _dioSSO;

  ApiProvider(this._dioSSO);

  Future<SignInResponse?> signinLbsfaouServer(final String email,
      final String? idToken, final String provider) async {
    logger.d('${this.runtimeType} signinLbsfaouServer : $provider');
    _dioSSO!.options.headers.remove("Authorization");

    final FormData formData = new FormData.fromMap({
      "email": email,
      "id_token": idToken,
      "provider": provider,
    });

    try {
      Response response = await _dioSSO!.post(SIGN_IN, data: formData);
      return SignInResponse.fromJson(response.data, response.statusCode);
    } on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = SignInResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RefreshTokenResponse?> refreshToken(final String refreshToken, final String token) async{
    logger.d('${this.runtimeType} refreshToken');
    _dioSSO!.options.headers.remove("Authorization");

    final FormData formData = new FormData.fromMap({
      "refresh": refreshToken,
      "token": token,
    });

    try{
      Response response = await _dioSSO!.post(REFRESH_TOKEN, data: formData);
      return RefreshTokenResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RefreshTokenResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<SignOutResponse?> signOut(final String token, final String refresh) async{
    logger.d('${this.runtimeType} signOut ');
    _dioSSO!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "refresh": refresh,
    });

    try{
      Response response = await _dioSSO!.post(SIGN_OUT, data: formData);
      return SignOutResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = SignOutResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<DeleteUserResponse?> deleteUser(final String token) async{
    logger.d('${this.runtimeType} deleteUser ');
    _dioSSO!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
    });

    try{
      Response response = await _dioSSO!.post(DELETE_USER, data: formData);
      return DeleteUserResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = DeleteUserResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  // Not Used
  /*
  Future<RefreshTokenResponse?> refreshTokenInLbsfaou(final String refreshToken, final String token) async {
    logger.d('${this.runtimeType} refreshTokenInLbsfaou');
    _dioSSO!.options.headers.remove("Authorization");

    final FormData formData = new FormData.fromMap({
      "refresh": refreshToken,
      "token": token,
    });

    try {
      Response response = await _dioSSO!.post(REFRESH_TOKEN, data: formData);
      return RefreshTokenResponse.fromJson(response.data, response.statusCode);
    } on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      if (error.response != null) {
        return RefreshTokenResponse.fromJson(
            error.response!.data, error.response!.statusCode);
      } else {
        return null;
      }
    }
  }

  Future<GetAppTokenResponse?> getAppToken(final String ssoToken) async {
    logger.d('${this.runtimeType} getAppToken');
    _dioSSO!.options.headers["Authorization"] = "JWT $ssoToken";

    final FormData formData = new FormData.fromMap({
    });

    try {
      Response response = await _dioSSO!.post(GET_APP_TOKEN, data: formData);
      return GetAppTokenResponse.fromJson(response.data, response.statusCode);
    } on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      if (error.response != null) {
        return GetAppTokenResponse.fromJson(error.response!.data, error.response!.statusCode);
      } else {
        return null;
      }
    }
  }
   */
}
