import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSReviewMgmtState extends BlocStateBase {
  const FSReviewMgmtState();

  @override
  List<Object?> get props => [];
}

class FSReviewMgmtInitial extends FSReviewMgmtState {
  @override
  String toString() => 'FSReviewMgmtInitial';
}

class FSReviewMgmtInitDone extends FSReviewMgmtState {
  @override
  String toString() => 'FSReviewMgmtInitDone';
}

class FSReviewMgmtUpdateReviewSuccess extends FSReviewMgmtState {
  final Review review;
  final bool updated;

  FSReviewMgmtUpdateReviewSuccess({
    required this.review,
    required this.updated,
  }) : super();

  @override
  List<Object> get props => [review, updated];

  @override
  String toString() => 'FSReviewMgmtUpdateReviewSuccess';
}

class FSReviewMgmtUpdateReviewFailure extends FSReviewMgmtState {
  final String comment;

  FSReviewMgmtUpdateReviewFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSReviewMgmtUpdateReviewFailure';
}

class FSReviewMgmtGetReviewsAndUnAnsweredReviewsSuccess extends FSReviewMgmtState {
  final ReviewInfo? reviewInfo;
  final ReviewInfo? unansweredReviewInfo;

  FSReviewMgmtGetReviewsAndUnAnsweredReviewsSuccess({
    required this.reviewInfo,
    required this.unansweredReviewInfo,
  }) : super();

  @override
  List<Object?> get props => [reviewInfo, unansweredReviewInfo];

  @override
  String toString() => 'FSReviewMgmtGetReviewsAndUnAnsweredReviewsSuccess';
}

class FSReviewMgmtGetReviewsAndUnAnsweredReviewsFailure extends FSReviewMgmtState {
  final String comment;

  FSReviewMgmtGetReviewsAndUnAnsweredReviewsFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSReviewMgmtGetReviewsAndUnAnsweredReviewsFailure';
}

class FSReviewMgmtUnRegisterReviewSuccess extends FSReviewMgmtState {
  final int? reviewId;

  FSReviewMgmtUnRegisterReviewSuccess({
    required this.reviewId,
  }) : super();

  @override
  List<Object?> get props => [reviewId];

  @override
  String toString() => 'FSReviewMgmtUnRegisterReviewSuccess';
}

class FSReviewMgmtUnRegisterReviewFailure extends FSReviewMgmtState {
  final String comment;

  FSReviewMgmtUnRegisterReviewFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSReviewMgmtUnRegisterReviewFailure';
}

class FSReviewMgmtActivateStoreReviewSuccess extends FSReviewMgmtState {
  final bool enable;

  FSReviewMgmtActivateStoreReviewSuccess({
    required this.enable,
  }) : super();

  @override
  List<Object?> get props => [];

  @override
  String toString() => 'FSReviewMgmtActivateStoreReviewSuccess';
}

class FSReviewMgmtActivateStoreReviewFailure extends FSReviewMgmtState {
  final String comment;

  FSReviewMgmtActivateStoreReviewFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSReviewMgmtActivateStoreReviewFailure';
}


class FSReviewMgmtRefreshTokenRequired extends FSReviewMgmtState {
  final FSReviewMgmtEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSReviewMgmtRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSReviewMgmtRefreshTokenRequired';
}