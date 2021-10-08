// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
    id: json['id'] as int,
    email: json['email'] as String,
    picture: json['picture'] as String?,
    store: json['store'] as int,
    storeName: json['store_name'] as String,
    review: json['review'] as String,
    rating: json['rating'] as int?,
    created: json['created'] as String,
    editable: json['editable'] as bool? ?? false,
    replyable: json['replyable'] as bool? ?? false,
    reportable: json['reportable'] as bool? ?? false,
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
        .toList(),
    parent: json['parent'] as int?,
  );
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'picture': instance.picture,
      'store': instance.store,
      'store_name': instance.storeName,
      'review': instance.review,
      'rating': instance.rating,
      'created': instance.created,
      'editable': instance.editable,
      'replyable': instance.replyable,
      'reportable': instance.reportable,
      'children': instance.children,
      'parent': instance.parent,
    };
