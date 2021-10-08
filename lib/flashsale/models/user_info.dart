import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo{
  String email;
  @JsonKey(name: 'is_active')
  bool isActive;
  String type;
  @JsonKey(name: 'store_owner')
  StoreOwner? storeOwner;
  List<Store?>? store;
  List<Posting?>? posting;
  @JsonKey(name: 'extra_user_info')
  ExtraUserInfo? extraUserInfo;
  @JsonKey(name: 'store_recipient')
  StoreRecipient? storeRecipient;
  @JsonKey(name: 'store_giver')
  StoreGiver? storeGiver;
  @JsonKey(name: 'settings')

  UserInfo({
    required this.email,
    required this.isActive,
    required this.type,
    this.storeOwner,
    this.store,
    this.posting,
    this.extraUserInfo,
    this.storeRecipient,
    this.storeGiver,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}