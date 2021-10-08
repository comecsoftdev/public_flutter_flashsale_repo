// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    id: json['id'] as int,
    email: json['email'] as String,
    store: json['store'] as String,
    comment: json['comment'] as String,
    created: json['created'] as String,
    editable: json['editable'] as bool? ?? false,
    replyable: json['replyable'] as bool? ?? false,
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'store': instance.store,
      'comment': instance.comment,
      'created': instance.created,
      'editable': instance.editable,
      'replyable': instance.replyable,
      'children': instance.children,
    };
