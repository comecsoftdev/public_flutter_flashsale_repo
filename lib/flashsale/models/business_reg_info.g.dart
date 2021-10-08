// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_reg_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessRegInfo _$BusinessRegInfoFromJson(Map<String, dynamic> json) {
  return BusinessRegInfo(
    id: json['id'] as int,
    image: json['image'] as String?,
    ownerName: json['owner_name'] as String?,
    storeName: json['store_name'] as String?,
    rgstID: json['rgstID'] as String?,
    address: json['address'] as String?,
  );
}

Map<String, dynamic> _$BusinessRegInfoToJson(BusinessRegInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'owner_name': instance.ownerName,
      'store_name': instance.storeName,
      'rgstID': instance.rgstID,
      'address': instance.address,
    };
