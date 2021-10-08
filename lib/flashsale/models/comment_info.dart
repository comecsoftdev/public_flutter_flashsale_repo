import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'comment_info.g.dart';

@JsonSerializable()
class CommentInfo {
  @JsonKey(name: 'total_count')
  int totalCount;
  @JsonKey(name: 'page_size')
  int pageSize;
  int page;
  @JsonKey(name: 'result')
  List<Comment>? comments;

  CommentInfo({
    required this.totalCount,
    required this.pageSize,
    required this.page,
    this.comments
  });

  factory CommentInfo.fromJson(Map<String, dynamic> json) => _$CommentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentInfoToJson(this);
}
