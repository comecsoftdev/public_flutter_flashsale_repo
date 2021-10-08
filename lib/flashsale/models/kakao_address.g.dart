// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoMeta _$KakaoMetaFromJson(Map<String, dynamic> json) {
  return KakaoMeta(
    total_count: json['total_count'] as int?,
    pageable_count: json['pageable_count'] as int?,
    is_end: json['is_end'] as bool?,
  );
}

Map<String, dynamic> _$KakaoMetaToJson(KakaoMeta instance) => <String, dynamic>{
      'total_count': instance.total_count,
      'pageable_count': instance.pageable_count,
      'is_end': instance.is_end,
    };

KaKaoDocument _$KaKaoDocumentFromJson(Map<String, dynamic> json) {
  return KaKaoDocument(
    address_name: json['address_name'] as String?,
    x: json['x'] as String?,
    y: json['y'] as String?,
    address_type: json['address_type'] as String?,
    address: json['address'] == null
        ? null
        : KaKaoAddress.fromJson(json['address'] as Map<String, dynamic>),
    road_address: json['road_address'] == null
        ? null
        : KaKaoRoadAddress.fromJson(
            json['road_address'] as Map<String, dynamic>),
    region_type: json['region_type'] as String?,
    code: json['code'] as String?,
  );
}

Map<String, dynamic> _$KaKaoDocumentToJson(KaKaoDocument instance) =>
    <String, dynamic>{
      'address_name': instance.address_name,
      'x': instance.x,
      'y': instance.y,
      'address_type': instance.address_type,
      'address': instance.address,
      'road_address': instance.road_address,
      'region_type': instance.region_type,
      'code': instance.code,
    };

KaKaoDocumentRegionCode _$KaKaoDocumentRegionCodeFromJson(
    Map<String, dynamic> json) {
  return KaKaoDocumentRegionCode(
    region_type: json['region_type'] as String?,
    address_name: json['address_name'] as String?,
    code: json['code'] as String?,
  );
}

Map<String, dynamic> _$KaKaoDocumentRegionCodeToJson(
        KaKaoDocumentRegionCode instance) =>
    <String, dynamic>{
      'region_type': instance.region_type,
      'address_name': instance.address_name,
      'code': instance.code,
    };

KaKaoAddress _$KaKaoAddressFromJson(Map<String, dynamic> json) {
  return KaKaoAddress(
    address_name: json['address_name'] as String?,
    region_1depth_name: json['region_1depth_name'] as String?,
    region_2depth_name: json['region_2depth_name'] as String?,
    region_3depth_name: json['region_3depth_name'] as String?,
    region_3depth_h_name: json['region_3depth_h_name'] as String?,
    h_code: json['h_code'] as String?,
    b_code: json['b_code'] as String?,
    mountain_yn: json['mountain_yn'] as String?,
    main_address_no: json['main_address_no'] as String?,
    sub_address_no: json['sub_address_no'] as String?,
    zip_code: json['zip_code'] as String?,
    x: json['x'] as String?,
    y: json['y'] as String?,
  );
}

Map<String, dynamic> _$KaKaoAddressToJson(KaKaoAddress instance) =>
    <String, dynamic>{
      'address_name': instance.address_name,
      'region_1depth_name': instance.region_1depth_name,
      'region_2depth_name': instance.region_2depth_name,
      'region_3depth_name': instance.region_3depth_name,
      'region_3depth_h_name': instance.region_3depth_h_name,
      'h_code': instance.h_code,
      'b_code': instance.b_code,
      'mountain_yn': instance.mountain_yn,
      'main_address_no': instance.main_address_no,
      'sub_address_no': instance.sub_address_no,
      'zip_code': instance.zip_code,
      'x': instance.x,
      'y': instance.y,
    };

KaKaoRoadAddress _$KaKaoRoadAddressFromJson(Map<String, dynamic> json) {
  return KaKaoRoadAddress(
    address_name: json['address_name'] as String?,
    region_1depth_name: json['region_1depth_name'] as String?,
    region_2depth_name: json['region_2depth_name'] as String?,
    region_3depth_name: json['region_3depth_name'] as String?,
    road_name: json['road_name'] as String?,
    underground_yn: json['underground_yn'] as String?,
    main_building_no: json['main_building_no'] as String?,
    sub_building_no: json['sub_building_no'] as String?,
    building_name: json['building_name'] as String?,
    zone_no: json['zone_no'] as String?,
    x: json['x'] as String?,
    y: json['y'] as String?,
  );
}

Map<String, dynamic> _$KaKaoRoadAddressToJson(KaKaoRoadAddress instance) =>
    <String, dynamic>{
      'address_name': instance.address_name,
      'region_1depth_name': instance.region_1depth_name,
      'region_2depth_name': instance.region_2depth_name,
      'region_3depth_name': instance.region_3depth_name,
      'road_name': instance.road_name,
      'underground_yn': instance.underground_yn,
      'main_building_no': instance.main_building_no,
      'sub_building_no': instance.sub_building_no,
      'building_name': instance.building_name,
      'zone_no': instance.zone_no,
      'x': instance.x,
      'y': instance.y,
    };
