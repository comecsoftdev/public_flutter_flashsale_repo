// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushMessage _$PushMessageFromJson(Map<String, dynamic> json) {
  return PushMessage(
    type: json['type'] as int,
    extraUserInfo: json['extra_user_info'] == null
        ? null
        : ExtraUserInfo.fromJson(
            json['extra_user_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PushMessageToJson(PushMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'extra_user_info': instance.extraUserInfo,
    };
