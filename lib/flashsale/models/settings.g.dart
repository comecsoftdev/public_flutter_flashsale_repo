// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FsSettings _$FsSettingsFromJson(Map<String, dynamic> json) {
  return FsSettings(
    l3STime: json['l3_s_time'] as int?,
    l3ETime: json['l3_e_time'] as int?,
    l2STime: json['l2_s_time'] as int?,
    l2ETime: json['l2_e_time'] as int?,
    addrVer: json['addr_ver'] as int?,
  )
    ..appVer = json['app_ver'] as String?
    ..maxProductCount = json['max_product_count'] as int?
    ..distanceLimit = json['distance_limit'] as int?;
}

Map<String, dynamic> _$FsSettingsToJson(FsSettings instance) =>
    <String, dynamic>{
      'l3_s_time': instance.l3STime,
      'l3_e_time': instance.l3ETime,
      'l2_s_time': instance.l2STime,
      'l2_e_time': instance.l2ETime,
      'addr_ver': instance.addrVer,
      'app_ver': instance.appVer,
      'max_product_count': instance.maxProductCount,
      'distance_limit': instance.distanceLimit,
    };
