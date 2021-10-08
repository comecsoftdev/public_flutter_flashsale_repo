import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/accounts/models/models.dart';

abstract class SSOSignInEvent extends BlocEventBase {
  const SSOSignInEvent();

  @override
  List<Object?> get props => [];
}

class SSOSignInAppServer extends SSOSignInEvent{
  final String email;
  final String? token;
  final String provider;
  final User user;

  SSOSignInAppServer({
    required this.email,
    required this.token,
    required this.provider,
    required this.user
  }) : super();

  @override
  List<Object?> get props => [email, token, provider, user];

  @override
  String toString() => 'SSOSignInAppServer';
}