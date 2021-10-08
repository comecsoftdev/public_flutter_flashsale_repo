import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'push_message.g.dart';

//refer to server's PushType in model/push.py
enum PushMessageType {
  PostExpired,
  StoreLocked,
}

@JsonSerializable()
class PushMessage {
  int type;
  @JsonKey(name: 'extra_user_info')
  ExtraUserInfo? extraUserInfo;

  PushMessage({
    required this.type,
    required this.extraUserInfo,
  });

  factory PushMessage.fromJson(Map<String, dynamic> json) => _$PushMessageFromJson(json);

  Map<String, dynamic> toJson() => _$PushMessageToJson(this);
}
