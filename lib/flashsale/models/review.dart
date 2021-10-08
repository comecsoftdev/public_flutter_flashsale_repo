import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'review.g.dart';

@JsonSerializable()
class Review {
  int id;
  String email;
  String? picture;
  int store;
  @JsonKey(name: 'store_name')
  String storeName;
  String review;
  int? rating;
  String created;                   //address or car no
  @JsonKey(defaultValue : false)
  bool? editable;                    //true If you can edit or delete a review
  @JsonKey(defaultValue : false)
  bool? replyable;                   //true If you can reply to a review
  @JsonKey(defaultValue : false)
  bool? reportable;                  //true If you can report a review
  List<Review>? children;
  int? parent;

  Review({
    required this.id,
    required this.email,
    this.picture,
    required this.store,
    required this.storeName,
    required this.review,
    this.rating,
    required this.created,
    this.editable,
    this.replyable,
    this.reportable,
    this.children,
    this.parent,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  factory Review.clone(Review review) => Review(
    id : review.id,
    email: review.email,
    picture: review.picture,
    store: review.store,
    storeName: review.storeName,
    review: review.review,
    rating: review.rating,
    created: review.created,
    editable: review.editable,
    replyable: review.replyable,
    reportable: review.reportable,
    children: review.children,
    parent: review.parent,
  );
}
