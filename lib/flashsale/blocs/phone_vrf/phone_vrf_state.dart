import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSPhoneVrfState extends BlocStateBase {
  const FSPhoneVrfState();

  @override
  List<Object?> get props => [];
}

class FSPhoneVrfInitial extends FSPhoneVrfState {
  @override
  String toString() => 'FSPhoneVrfInitial';
}

class FSPhoneVrfRefreshTokenRequired extends FSPhoneVrfState{
  final FSPhoneVrfEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSPhoneVrfRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSStoreReRefreshTokenRequired';
}

class FSPhoneVrfRequestCertCodeSuccess extends FSPhoneVrfState {
  FSPhoneVrfRequestCertCodeSuccess() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FSPhoneVrfRequestCertCodeSuccess';
}

class FSPhoneVrfRequestCertCodeFailure extends FSPhoneVrfState {
  final String comment;

  FSPhoneVrfRequestCertCodeFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSPhoneVrfRequestCertCodeFailure';
}

class FSPhoneVrfVerifyCertCodeSuccess extends FSPhoneVrfState {
  final String phone;

  FSPhoneVrfVerifyCertCodeSuccess({
    required this.phone,
  }) : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FSPhoneVrfVerifyCertCodeSuccess';
}

class FSPhoneVrfVerifyCertCodeFailure extends FSPhoneVrfState {
  final String comment;

  FSPhoneVrfVerifyCertCodeFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSPhoneVrfVerifyCertCodeFailure';
}

