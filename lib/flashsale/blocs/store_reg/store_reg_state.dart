import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSStoreRegState extends BlocStateBase {
  const FSStoreRegState();

  @override
  List<Object?> get props => [];
}

class FSStoreRegInitial extends FSStoreRegState {
  @override
  String toString() => 'FSStoreRegInitial';
}

class FSStoreRegRefreshTokenRequired extends FSStoreRegState{
  final FSStoreRegEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSStoreRegRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSStoreReRefreshTokenRequired';
}

class FSStoreRegRequestCertCodeSuccess extends FSStoreRegState {
  FSStoreRegRequestCertCodeSuccess() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FSStoreRegRequestCertCodeSuccess';
}

class FSStoreRegRequestCertCodeFailure extends FSStoreRegState {
  final String comment;

  FSStoreRegRequestCertCodeFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreRegRequestCertCodeFailure';
}

class FSStoreRegVerifyCertCodeSuccess extends FSStoreRegState {
  final String phone;

  FSStoreRegVerifyCertCodeSuccess({
    required this.phone,
  }) : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FSStoreRegVerifyCertCodeSuccess';
}

class FSStoreRegVerifyCertCodeFailure extends FSStoreRegState {
  final String comment;

  FSStoreRegVerifyCertCodeFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreRegVerifyCertCodeFailure';
}

class FSStoreRegUpdateStoreSuccess extends FSStoreRegState {
  final UserInfo? userInfo;
  final Store? store;
  final StoreOwner? storeOwner;
  final BusinessRegInfo? registration;

  FSStoreRegUpdateStoreSuccess({
    required this.userInfo,
    required this.store,
    required this.storeOwner,
    this.registration,
  }) : super();

  @override
  List<Object?> get props => [userInfo, store, storeOwner];

  @override
  String toString() => 'FSStoreRegUpdateStoreSuccess';
}

class FSStoreRegUpdateStoreFailure extends FSStoreRegState {
  final String comment;

  FSStoreRegUpdateStoreFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreRegUpdateStoreFailure';
}
