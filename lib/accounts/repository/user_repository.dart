import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:comecsoft/accounts/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';

class SSORepository{
  ApiProvider apiProvider = ApiProvider(DioHelper.getDio());

  Future<SignInResponse?> signinLbsfaouServer(final String email, final String? idToken, final String provider){
    return apiProvider.signinLbsfaouServer(email, idToken, provider);
  }

  Future<RefreshTokenResponse?> refreshToken(final String refreshToken, final String token){
    return apiProvider.refreshToken(refreshToken, token);
  }

  Future<SignOutResponse?> signOut(final String token, final String refresh){
    return apiProvider.signOut(token, refresh);
  }

  Future<DeleteUserResponse?> deleteUser(final String token){
    return apiProvider.deleteUser(token);
  }

  /*Future<RefreshTokenResponse> refreshToken(final String refreshToken, final String token){
    return apiProvider.refreshTokenInLbsfaou(refreshToken, token);
  }

  Future<GetAppTokenResponse> getAppToken(final String ssoToken){
    return apiProvider.getAppToken(ssoToken);
  }*/
}