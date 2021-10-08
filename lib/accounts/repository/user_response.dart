import 'package:flutter/cupertino.dart';
import 'package:comecsoft/accounts/models/models.dart';
import 'package:comecsoft/common/abstract_base.dart';

class SignInResponse extends RepositoryResponse{
  final String? token;
  final String? refresh;
  final String? appToken;

  SignInResponse({this.token, this.refresh, this.appToken, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory SignInResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return SignInResponse(
      token: json["token"] == null ? null : json["token"],
      refresh: json["refresh"] == null ? null : json["refresh"],
      appToken: json["app_token"] == null ? null : json["app_token"],
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}

class RefreshTokenResponse extends RepositoryResponse{
  final String? token;

  RefreshTokenResponse({this.token, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return RefreshTokenResponse(
      token: json["token"] == null ? null : json["token"],
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}

class SignOutResponse extends RepositoryResponse{
  SignOutResponse({statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory SignOutResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return SignOutResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
    );
  }
}

class DeleteUserResponse extends RepositoryResponse{
  DeleteUserResponse({statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return DeleteUserResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
    );
  }
}

// Not Used
/*
class RefreshTokenResponse extends RepositoryResponse{
  final String? token;

  RefreshTokenResponse({this.token, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return RefreshTokenResponse(
      token: json["token"] == null ? null : json["token"],
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}

class GetAppTokenResponse extends RepositoryResponse{
  final String? appToken;

  GetAppTokenResponse({this.appToken, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetAppTokenResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetAppTokenResponse(
      appToken: json["app_token"] == null ? null : json["app_token"],
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}
 */