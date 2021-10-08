// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewInfo _$ReviewInfoFromJson(Map<String, dynamic> json) {
  return ReviewInfo(
    totalCount: json['total_count'] as int,
    pageSize: json['page_size'] as int,
    page: json['page'] as int,
    base: json['base'] as String,
    reviews: (json['result'] as List<dynamic>?)
        ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ReviewInfoToJson(ReviewInfo instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'page_size': instance.pageSize,
      'page': instance.page,
      'result': instance.reviews,
      'base': instance.base,
    };
