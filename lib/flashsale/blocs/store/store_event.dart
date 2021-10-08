import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/common/constants.dart' as constants;

abstract class FSStoreEvent extends BlocEventBase {
  const FSStoreEvent();

  @override
  List<Object?> get props => [];
}

class FSStoreInit extends FSStoreEvent {}

class FSStoreGetPostedStore extends FSStoreEvent{
  final String token;
  final int storeId;
  final int page;                 // comment page number
  final int pageSize;            // comment page size

  FSStoreGetPostedStore({
    required this.token,
    required this.storeId,
    this.page = 1,
    this.pageSize = constants.defaultPageSize,
  }) : super();

  @override
  List<Object> get props => [token, storeId, page, pageSize];

  @override
  String toString() => 'FSStoreGetPostedStore';
}

class FSStoreRegUpdateRating extends FSStoreEvent{
  final String token;
  final int? storeId;      //storeID for register rating
  final int? ratingId;     //ratingID for update rating
  final int rating;

  FSStoreRegUpdateRating({
    required this.token,
    required this.rating,
    this.ratingId,
    this.storeId,
  }) : super();

  @override
  List<Object?> get props => [token, storeId, ratingId, rating];

  @override
  String toString() => 'FSRegUpdateRating';
}

class FSStoreRegUpdateComment extends FSStoreEvent{
  final String token;
  final int? storeId;      //storeID for register comment
  final int? commentId;     //commentID for update comment
  final int? parent;     //parent for reply comment
  final String comment;

  FSStoreRegUpdateComment({
    required this.token,
    required this.comment,
    this.commentId,
    this.parent,
    this.storeId,
  }) : super();

  @override
  List<Object?> get props => [token, storeId, commentId, parent, comment];

  @override
  String toString() => 'FSStoreRegUpdateComment';
}

class FSStoreUnRegisterComment extends FSStoreEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int commentId;     //commentID for update comment

  FSStoreUnRegisterComment({
    required this.token,
    required this.commentId,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, commentId];

  @override
  String toString() => 'FSStoreUnRegisterComment';
}

class FSStoreUnRegisterReview extends FSStoreEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int reviewId;     //commentID for update comment

  FSStoreUnRegisterReview({
    required this.token,
    required this.reviewId,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, reviewId];

  @override
  String toString() => 'FSStoreUnRegisterReview';
}

class FSStoreRegisterReviewReport extends FSStoreEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int reviewId;     //commentID for update comment

  FSStoreRegisterReviewReport({
    required this.token,
    required this.reviewId,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, reviewId];

  @override
  String toString() => 'FSStoreRegisterReviewReport';
}

class FSStoreGetReviews extends FSStoreEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int? page;
  final int? pageSize;
  final String? base;

  FSStoreGetReviews({
    required this.token,
    required this.storeId,
    this.page,
    this.pageSize,
    this.base,
  }) : super();

  @override
  List<Object?> get props => [token, storeId, page, pageSize, base];

  @override
  String toString() => 'FSStoreGetReviews';
}

class FSStoreUnregisterPost extends FSStoreEvent{
  final String token;
  final int storeId;

  FSStoreUnregisterPost({
    required this.token,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, ];

  @override
  String toString() => 'FSStoreUnregisterPost';
}
