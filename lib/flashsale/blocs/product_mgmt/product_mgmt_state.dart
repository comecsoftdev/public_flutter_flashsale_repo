import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSProductMgmtState extends BlocStateBase {
  const FSProductMgmtState();

  @override
  List<Object?> get props => [];
}

class FSProductMgmtInitial extends FSProductMgmtState {
  @override
  String toString() => 'FSStoreInitial';
}

class FSProductMgmtRefreshTokenRequired extends FSProductMgmtState {
  final FSProductMgmtEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSProductMgmtRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSProductMgmtRefreshTokenRequired';
}

class FSProductMgmtUnRegisterProductSuccess extends FSProductMgmtState {
  final int? productId;

  FSProductMgmtUnRegisterProductSuccess({
    required this.productId,
  }) : super();

  @override
  List<Object?> get props => [productId];

  @override
  String toString() => 'FSProductMgmtUnRegisterProductSuccess';
}

class FSProductMgmtUnRegisterProductFailure extends FSProductMgmtState {
  final String comment;

  FSProductMgmtUnRegisterProductFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSProductMgmtUnRegisterProductFailure';
}
