// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreOwner _$StoreOwnerFromJson(Map<String, dynamic> json) {
  return StoreOwner(
    id: json['id'] as int?,
    ownerName: json['name'] as String?,
    ownerPhone:
        const CustomPhoneNumberConverter().fromJson(json['phone'] as String),
  );
}

Map<String, dynamic> _$StoreOwnerToJson(StoreOwner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.ownerName,
      'phone': const CustomPhoneNumberConverter().toJson(instance.ownerPhone),
    };
