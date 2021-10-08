import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSProductRegState extends BlocStateBase {
  const FSProductRegState();

  @override
  List<Object?> get props => [];
}

class FSProductRegInitial extends FSProductRegState {
  @override
  String toString() => 'FSProductRegInitial';
}

class FSProductRegRefreshTokenRequired extends FSProductRegState{
  final FSProductRegEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSProductRegRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSProductRegRefreshTokenRequired';
}

class FSProductRegUpdateProductSuccess extends FSProductRegState {
  final Product? product;

  FSProductRegUpdateProductSuccess({
    required this.product,
  }) : super();

  @override
  List<Object?> get props => [product];

  @override
  String toString() => 'FSProductRegisterProductSuccess';
}

class FSProductRegUpdateProductFailure extends FSProductRegState {
  final String comment;

  FSProductRegUpdateProductFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSProductRegisterProductFailure';
}
