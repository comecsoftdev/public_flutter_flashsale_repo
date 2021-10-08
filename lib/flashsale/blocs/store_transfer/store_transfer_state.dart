import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSStoreTransferState extends BlocStateBase {
  const FSStoreTransferState();

  @override
  List<Object?> get props => [];
}

class FSStoreTransferInitial extends FSStoreTransferState {
  @override
  String toString() => 'FSStoreTransferInitial';
}

class FSStoreTransferRefreshTokenRequired extends FSStoreTransferState {
  final FSStoreTransferEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSStoreTransferRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSStoreTransferRefreshTokenRequired';
}

class FSStoreTransferRequestCertCodeSuccess extends FSStoreTransferState {
  FSStoreTransferRequestCertCodeSuccess() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FSStoreTransferRequestCertCodeSuccess';
}

class FSStoreTransferRequestCertCodeFailure extends FSStoreTransferState {
  final String comment;

  FSStoreTransferRequestCertCodeFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreTransferRequestCertCodeFailure';
}

class FSStoreTransferVerifyCertCodeSuccess extends FSStoreTransferState {
  final String phone;

  FSStoreTransferVerifyCertCodeSuccess({
    required this.phone,
  }) : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FSStoreTransferVerifyCertCodeSuccess';
}

class FSStoreTransferVerifyCertCodeFailure extends FSStoreTransferState {
  final String comment;

  FSStoreTransferVerifyCertCodeFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreTransferVerifyCertCodeFailure';
}

class FSStoreTransferAcceptSuccess extends FSStoreTransferState {
  final UserInfo? userInfo;

  FSStoreTransferAcceptSuccess({
    required this.userInfo,
  }) : super();

  @override
  List<Object?> get props => [userInfo, ];

  @override
  String toString() => 'FSStoreTransferAcceptSuccess';
}

class FSStoreTransferAcceptFailure extends FSStoreTransferState {
  final String comment;

  FSStoreTransferAcceptFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreTransferAcceptFailure';
}

class FSStoreTransferTransferRejectSuccess extends FSStoreTransferState {
  final int transferId;

  FSStoreTransferTransferRejectSuccess({
    required this.transferId,
  }) : super();

  @override
  List<Object> get props => [transferId, ];

  @override
  String toString() => 'FSStoreTransferTransferRejectSuccess';
}

class FSStoreTransferTransferRejectFailure extends FSStoreTransferState {
  final String comment;

  FSStoreTransferTransferRejectFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreTransferTransferRejectFailure';
}