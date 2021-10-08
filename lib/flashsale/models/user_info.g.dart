// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    email: json['email'] as String,
    isActive: json['is_active'] as bool,
    type: json['type'] as String,
    storeOwner: json['store_owner'] == null
        ? null
        : StoreOwner.fromJson(json['store_owner'] as Map<String, dynamic>),
    store: (json['store'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Store.fromJson(e as Map<String, dynamic>))
        .toList(),
    posting: (json['posting'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Posting.fromJson(e as Map<String, dynamic>))
        .toList(),
    extraUserInfo: json['extra_user_info'] == null
        ? null
        : ExtraUserInfo.fromJson(
            json['extra_user_info'] as Map<String, dynamic>),
    storeRecipient: json['store_recipient'] == null
        ? null
        : StoreRecipient.fromJson(
            json['store_recipient'] as Map<String, dynamic>),
    storeGiver: json['store_giver'] == null
        ? null
        : StoreGiver.fromJson(json['store_giver'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'email': instance.email,
      'is_active': instance.isActive,
      'type': instance.type,
      'store_owner': instance.storeOwner,
      'store': instance.store,
      'posting': instance.posting,
      'extra_user_info': instance.extraUserInfo,
      'store_recipient': instance.storeRecipient,
      'store_giver': instance.storeGiver,
    };
