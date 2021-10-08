import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/common/constants.dart' as constants;

abstract class FSReviewMgmtEvent extends BlocEventBase {
  const FSReviewMgmtEvent();

  @override
  List<Object?> get props => [];
}

class FSReviewMgmtInit extends FSReviewMgmtEvent {}

class FSReviewMgmtRegUpdateReview extends FSReviewMgmtEvent{
  final String token;
  final int? storeId;      //storeID for register review
  final int? reviewId;     //reviewID for update review
  final int? parent;       //parent for reply review
  final String review;     //review
  final int? rating;       //rating

  FSReviewMgmtRegUpdateReview({
    required this.token,
    this.storeId,
    this.reviewId,
    this.parent,
    required this.review,
    this.rating,
  }) : super();

  @override
  List<Object?> get props => [token, storeId, reviewId, parent, review, rating];

  @override
  String toString() => 'FSReviewMgmtRegUpdateReview';
}

class FSReviewMgmtGetReviews extends FSReviewMgmtEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int? page;
  final int? pageSize;

  FSReviewMgmtGetReviews({
    required this.token,
    required this.storeId,
    this.page,
    this.pageSize
  }) : super();

  @override
  List<Object?> get props => [token, storeId, page, pageSize];

  @override
  String toString() => 'FSReviewMgmtGetReviews';
}

class FSReviewMgmtGetReviewsAndUnAnsweredReviews extends FSReviewMgmtEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int? page;
  final int? pageSize;
  final String? base;

  FSReviewMgmtGetReviewsAndUnAnsweredReviews({
    required this.token,
    required this.storeId,
    this.page,
    this.pageSize,
    this.base,
  }) : super();

  @override
  List<Object?> get props => [token, storeId, page, pageSize, base];

  @override
  String toString() => 'FSReviewMgmtGetReviewsAndUnAnsweredReviews';
}

class FSReviewMgmtUnRegisterReview extends FSReviewMgmtEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int reviewId;     //commentID for update comment

  FSReviewMgmtUnRegisterReview({
    required this.token,
    required this.reviewId,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, reviewId];

  @override
  String toString() => 'FSReviewMgmtUnRegisterReview';
}

class FSReviewMgmtActivateStoreReview extends FSReviewMgmtEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final bool enable;

  FSReviewMgmtActivateStoreReview({
    required this.token,
    required this.storeId,
    required this.enable,
  }) : super();

  @override
  List<Object> get props => [token, storeId, enable];

  @override
  String toString() => 'FSReviewMgmtActivateStoreReview';
}