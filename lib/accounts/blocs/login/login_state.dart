import 'package:comecsoft/accounts/blocs/blocs.dart';
import 'package:comecsoft/accounts/models/models.dart';
import 'package:comecsoft/common/abstract_base.dart';

abstract class SSOSignInState extends BlocStateBase {
  const SSOSignInState();

  @override
  List<Object?> get props => [];
}

class SSOSignInInitial extends SSOSignInState {}

class SSOSignInFailure extends SSOSignInState {
  final String comment;

  SSOSignInFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() =>
      'LoginFailure {  }';
}

class SSOSignInSuccess extends SSOSignInState {
  final String? token;
  final String? refreshToken;
  final String? appToken;
  final User user;
  final String provider;
  final String? providerToken;

  SSOSignInSuccess({
    required this.token,
    required this.refreshToken,
    required this.user,
    required this.appToken,
    required this.provider,
    required this.providerToken,
  }) : super();

  @override
  List<Object?> get props => [token, refreshToken, user, appToken, provider, providerToken];

  @override
  String toString() =>
      'SSOSignInSuccess {  }';
}

class SSOSignInNetworkFailure extends SSOSignInState {
  final SSOSignInAppServer event;

  SSOSignInNetworkFailure({
    required this.event,
  }) : super();

  @override
  String toString() =>
      'SSOLoginNetworkFailure';
}