import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSStoreMgmtState extends BlocStateBase {
  const FSStoreMgmtState();

  @override
  List<Object?> get props => [];
}

class FSStoreMgmtInitial extends FSStoreMgmtState {
  @override
  String toString() => 'FSStoreMgmtInitial';
}

class FSStoreMgmtRefreshTokenRequired extends FSStoreMgmtState {
  final FSStoreMgmtEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSStoreMgmtRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSStoreMgmtRefreshTokenRequired';
}

class FSStoreMgmtUnRegisterProductSuccess extends FSStoreMgmtState {
  final int? productId;

  FSStoreMgmtUnRegisterProductSuccess({
    required this.productId,
  }) : super();

  @override
  List<Object?> get props => [productId];

  @override
  String toString() => 'FSStoreMgmtUnRegisterProductSuccess';
}

class FSStoreMgmtUnRegisterProductFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtUnRegisterProductFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtUnRegisterProductFailure';
}

class FSStoreMgmtUnRegisterBRCSuccess extends FSStoreMgmtState {
  final int? registrationId;

  FSStoreMgmtUnRegisterBRCSuccess({
    required this.registrationId,
  }) : super();

  @override
  List<Object?> get props => [registrationId];

  @override
  String toString() => 'FSStoreMgmtUnRegisterBRCSuccess';
}

class FSStoreMgmtUnRegisterBRCFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtUnRegisterBRCFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtUnRegisterBRCFailure';
}

class FSStoreMgmtUnRegisterPostSuccess extends FSStoreMgmtState {
  final int? storeId;
  final ExtraUserInfo? extraUserInfo;

  FSStoreMgmtUnRegisterPostSuccess({
    required this.storeId,
    this.extraUserInfo,
  }) : super();

  @override
  List<Object?> get props => [storeId, extraUserInfo];

  @override
  String toString() => 'FSStoreMgmtUnRegisterPostSuccess';
}

class FSStoreMgmtUnRegisterPostFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtUnRegisterPostFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtUnRegisterPostFailure';
}

class FSStoreMgmtGetPostedStoreSuccess extends FSStoreMgmtState {
  final Store store;
  final CommentInfo? commentInfo;
  final Rating? myRating;
  final Comment? myComment;

  FSStoreMgmtGetPostedStoreSuccess({
    required this.store,
    required this.commentInfo,
    this.myRating,
    this.myComment
  }) : super();

  @override
  List<Object?> get props => [store, commentInfo];

  @override
  String toString() => 'FSStoreMgmtGetPostedStoreSuccess';
}

class FSStoreMgmtGetPostedStoreFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtGetPostedStoreFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtGetPostedStoreFailure';
}

class FSStoreMgmtGetCommentsSuccess extends FSStoreMgmtState {
  final CommentInfo? commentInfo;

  FSStoreMgmtGetCommentsSuccess({
    required this.commentInfo,
  }) : super();

  @override
  List<Object?> get props => [commentInfo];

  @override
  String toString() => 'FSStoreMgmtGetCommentsSuccess';
}

class FSStoreMgmtGetCommentsFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtGetCommentsFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtGetCommentsFailure';
}

class FSStoreMgmtRegUpdateCommentSuccess extends FSStoreMgmtState {
  final Comment comment;
  final bool updated;
  final int? parent;

  FSStoreMgmtRegUpdateCommentSuccess({
    required this.comment,
    required this.updated,
    this.parent,
  }) : super();

  @override
  List<Object?> get props => [comment, updated, parent];

  @override
  String toString() => 'FSStoreMgmtRegUpdateCommentSuccess';
}

class FSStoreMgmtRegUpdateCommentFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtRegUpdateCommentFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtRegUpdateCommentFailure';
}

class FSStoreMgmtUnRegisterCommentSuccess extends FSStoreMgmtState {
  final int? commentId;

  FSStoreMgmtUnRegisterCommentSuccess({
    required this.commentId,
  }) : super();

  @override
  List<Object?> get props => [commentId,];

  @override
  String toString() => 'FSStoreMgmtUnRegisterCommentSuccess';
}

class FSStoreMgmtUnRegisterCommentFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtUnRegisterCommentFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreUnRegisterCommentFailure';
}

class FSStoreMgmtRegisterReviewReportSuccess extends FSStoreMgmtState {
  final int? reportId;

  FSStoreMgmtRegisterReviewReportSuccess({
    required this.reportId,
  }) : super();

  @override
  List<Object?> get props => [reportId];

  @override
  String toString() => 'FSStoreMgmtRegisterReviewReportSuccess';
}

class FSStoreMgmtRegisterReviewReportFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtRegisterReviewReportFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtRegisterReviewReportFailure';
}

class FSStoreMgmtUnRegisterStoreSuccess extends FSStoreMgmtState {
  final int storeId;

  FSStoreMgmtUnRegisterStoreSuccess({
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [storeId];

  @override
  String toString() => 'FSStoreMgmtUnRegisterStoreSuccess';
}

class FSStoreMgmtUnRegisterStoreFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtUnRegisterStoreFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtUnRegisterStoreFailure';
}

class FSStoreMgmtGetStoreReportSuccess extends FSStoreMgmtState {
  final List<StoreReport> storeReport;

  FSStoreMgmtGetStoreReportSuccess({
    required this.storeReport,
  }) : super();

  @override
  List<Object> get props => [storeReport];

  @override
  String toString() => 'FSStoreMgmtGetStoreReportSuccess';
}

class FSStoreMgmtGetStoreReportFailure extends FSStoreMgmtState {
  final String comment;

  FSStoreMgmtGetStoreReportFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreMgmtGetStoreReportFailure';
}