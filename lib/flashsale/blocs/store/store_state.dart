import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSStoreState extends BlocStateBase {
  const FSStoreState();

  @override
  List<Object?> get props => [];
}

class FSStoreInitial extends FSStoreState {
  @override
  String toString() => 'FSStoreInitial';
}

class FSStoreInitDone extends FSStoreState {
  @override
  String toString() => 'FSStoreInitDone';
}

class FSStoreGetPostedStoreSuccess extends FSStoreState {
  final Store store;
  final ReviewInfo? reviewInfo;
  final Review? myReview;

  FSStoreGetPostedStoreSuccess({
    required this.store,
    required this.reviewInfo,
    this.myReview
  }) : super();

  @override
  List<Object?> get props => [store, reviewInfo, myReview];

  @override
  String toString() => 'FSStoreGetPostedStoreSuccess';
}

class FSStoreGetPostedStoreFailure extends FSStoreState {
  final String comment;

  FSStoreGetPostedStoreFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreGetPostedStoreFailure';
}

class FSStoreRefreshTokenRequired extends FSStoreState {
  final FSStoreEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSStoreRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSStoreRefreshTokenRequired';
}

class FSStoreRegUpdateRatingSuccess extends FSStoreState {
  final int ratingId;
  final int rating;
  final bool updated;

  FSStoreRegUpdateRatingSuccess({
    required this.ratingId,
    required this.rating,
    required this.updated,
  }) : super();

  @override
  List<Object> get props => [ratingId, rating, updated];

  @override
  String toString() => 'FSStoreRegUpdateRatingSuccess';
}

class FSStoreRegUpdateRatingFailure extends FSStoreState {
  final String comment;

  FSStoreRegUpdateRatingFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreRegUpdateRatingFailure';
}

class FSStoreRegUpdateCommentSuccess extends FSStoreState {
  final Comment comment;
  final bool updated;

  FSStoreRegUpdateCommentSuccess({
    required this.comment,
    required this.updated,
  }) : super();

  @override
  List<Object> get props => [comment, updated];

  @override
  String toString() => 'FSStoreRegUpdateCommentSuccess';
}

class FSStoreRegUpdateCommentFailure extends FSStoreState {
  final String comment;

  FSStoreRegUpdateCommentFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreRegUpdateCommentFailure';
}

class FSStoreUnRegisterCommentSuccess extends FSStoreState {
  final int? commentId;

  FSStoreUnRegisterCommentSuccess({
    required this.commentId,
  }) : super();

  @override
  List<Object?> get props => [commentId];

  @override
  String toString() => 'FSStoreUnRegisterCommentSuccess';
}

class FSStoreUnRegisterCommentFailure extends FSStoreState {
  final String comment;

  FSStoreUnRegisterCommentFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreUnRegisterCommentFailure';
}

class FSStoreUnRegisterReviewSuccess extends FSStoreState {
  final int? reviewId;

  FSStoreUnRegisterReviewSuccess({
    required this.reviewId,
  }) : super();

  @override
  List<Object?> get props => [reviewId];

  @override
  String toString() => 'FSStoreUnRegisterReviewSuccess';
}

class FSStoreUnRegisterReviewFailure extends FSStoreState {
  final String comment;

  FSStoreUnRegisterReviewFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreUnRegisterReviewFailure';
}

class FSStoreRegisterReviewReportSuccess extends FSStoreState {
  final int? reportId;

  FSStoreRegisterReviewReportSuccess({
    required this.reportId,
  }) : super();

  @override
  List<Object?> get props => [reportId];

  @override
  String toString() => 'FSStoreRegisterReviewReportSuccess';
}

class FSStoreRegisterReviewReportFailure extends FSStoreState {
  final String comment;

  FSStoreRegisterReviewReportFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreRegisterReviewReportFailure';
}

class FSStoreGetReviewsSuccess extends FSStoreState {
  final ReviewInfo? reviewInfo;

  FSStoreGetReviewsSuccess({
    required this.reviewInfo,
  }) : super();

  @override
  List<Object?> get props => [reviewInfo];

  @override
  String toString() => 'FSStoreGetReviewsSuccess';
}

class FSStoreGetReviewsFailure extends FSStoreState {
  final String comment;

  FSStoreGetReviewsFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreGetReviewsFailure';
}

class FSStoreUnRegisterPostSuccess extends FSStoreState {
  final int? storeId;
  final ExtraUserInfo? extraUserInfo;

  FSStoreUnRegisterPostSuccess({
    required this.storeId,
    this.extraUserInfo,
  }) : super();

  @override
  List<Object?> get props => [storeId, extraUserInfo];

  @override
  String toString() => 'FSStoreUnRegisterPostSuccess';
}

class FSStoreUnRegisterPostFailure extends FSStoreState {
  final String comment;

  FSStoreUnRegisterPostFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreUnRegisterPostFailure';
}

