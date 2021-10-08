import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'review_info.g.dart';

@JsonSerializable()
class ReviewInfo {
  @JsonKey(name: 'total_count')
  int totalCount;
  @JsonKey(name: 'page_size')
  int pageSize;
  int page;
  @JsonKey(name: 'result')
  List<Review>? reviews;
  // Reference time when the review was fetched
  String base;

  ReviewInfo({
    required this.totalCount,
    required this.pageSize,
    required this.page,
    required this.base,
    this.reviews
  });

  factory ReviewInfo.fromJson(Map<String, dynamic> json) => _$ReviewInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewInfoToJson(this);
}
