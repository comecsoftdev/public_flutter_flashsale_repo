import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/common/constants.dart' as constants;

abstract class FSReviewRegEvent extends BlocEventBase {
  const FSReviewRegEvent();

  @override
  List<Object?> get props => [];
}

class FSReviewRegUpdateReview extends FSReviewRegEvent{
  final String token;
  final int? storeId;      //storeID for register review
  final int? reviewId;     //reviewID for update review
  final int? parent;       //parent for reply review
  final String review;     //review
  final int? rating;       //rating

  FSReviewRegUpdateReview({
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
  String toString() => 'FSReviewRegUpdateReview';
}