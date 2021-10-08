import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSPostRegState extends BlocStateBase {
  const FSPostRegState();

  @override
  List<Object?> get props => [];
}

class FSPostRegInitial extends FSPostRegState {
  @override
  String toString() => 'FSPostRegInitial';
}

class FSPostRegRefreshTokenRequired extends FSPostRegState{
  final FSPostRegEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSPostRegRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSPostRegRefreshTokenRequired';
}

class FSPostRegUpdatePostSuccess extends FSPostRegState {
  final Posting? post;
  final List<int> products;

  FSPostRegUpdatePostSuccess({
    required this.post,
    required this.products,
  }) : super();

  @override
  List<Object?> get props => [post, products];

  @override
  String toString() => 'FSPostRegUpdatePostSuccess';
}

class FSPostRegUpdatePostFailure extends FSPostRegState {
  final String comment;

  FSPostRegUpdatePostFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSPostRegUpdatePostFailure';
}

