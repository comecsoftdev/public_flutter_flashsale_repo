import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSReviewRegState extends BlocStateBase {
  const FSReviewRegState();

  @override
  List<Object?> get props => [];
}

class FSReviewRegInitial extends FSReviewRegState {
  @override
  String toString() => 'FSReviewRegInitial';
}

class FSReviewRegUpdateReviewSuccess extends FSReviewRegState {
  final Review review;
  final bool updated;

  FSReviewRegUpdateReviewSuccess({
    required this.review,
    required this.updated,
  }) : super();

  @override
  List<Object> get props => [review, updated];

  @override
  String toString() => 'FSReviewRegUpdateReviewSuccess';
}

class FSReviewRegUpdateReviewFailure extends FSReviewRegState {
  final String comment;

  FSReviewRegUpdateReviewFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSReviewRegUpdateReviewFailure';
}

class FSReviewRegRefreshTokenRequired extends FSReviewRegState {
  final FSReviewRegEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSReviewRegRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSReviewRegRefreshTokenRequired';
}