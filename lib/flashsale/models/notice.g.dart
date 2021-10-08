// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return Notice(
    id: json['id'] as int,
    type: json['type'] as String,
    title: json['title'] as String,
    notice: json['notice'] as String,
    created: json['created'] as String,
    checked: json['checked'] as bool? ?? false,
  );
}

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'notice': instance.notice,
      'created': instance.created,
      'checked': instance.checked,
    };
