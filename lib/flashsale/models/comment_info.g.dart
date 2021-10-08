// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentInfo _$CommentInfoFromJson(Map<String, dynamic> json) {
  return CommentInfo(
    totalCount: json['total_count'] as int,
    pageSize: json['page_size'] as int,
    page: json['page'] as int,
    comments: (json['result'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CommentInfoToJson(CommentInfo instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'page_size': instance.pageSize,
      'page': instance.page,
      'result': instance.comments,
    };
