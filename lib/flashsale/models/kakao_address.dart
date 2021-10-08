import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'kakao_address.g.dart';

@JsonSerializable()
class KakaoMeta{
  int? total_count;
  int? pageable_count;
  bool? is_end;

  KakaoMeta({
    this.total_count,
    this.pageable_count,
    this.is_end
  });

  factory KakaoMeta.fromJson(Map<String, dynamic> json) => _$KakaoMetaFromJson(json);

  Map<String, dynamic> toJson() => _$KakaoMetaToJson(this);
}

// for https://dapi.kakao.com/v2/local/search/address.json
@JsonSerializable()
class KaKaoDocument{
  String? address_name;
  String? x;
  String? y;
  String? address_type;
  KaKaoAddress? address;
  KaKaoRoadAddress? road_address;

  String? region_type;
  String? code;

  KaKaoDocument({
    this.address_name,
    this.x,
    this.y,
    this.address_type,
    this.address,
    this.road_address,
    this.region_type,
    this.code
  });

  factory KaKaoDocument.fromJson(Map<String, dynamic> json) => _$KaKaoDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$KaKaoDocumentToJson(this);
}

// for https://dapi.kakao.com/v2/local/geo/coord2regioncode.json
@JsonSerializable()
class KaKaoDocumentRegionCode{
  String? region_type;
  String? address_name;
  String? code;

  KaKaoDocumentRegionCode({
    this.region_type,
    this.address_name,
    this.code,
  });

  factory KaKaoDocumentRegionCode.fromJson(Map<String, dynamic> json) => _$KaKaoDocumentRegionCodeFromJson(json);

  Map<String, dynamic> toJson() => _$KaKaoDocumentRegionCodeToJson(this);
}

@JsonSerializable()
class KaKaoAddress{
  String? address_name;
  String? region_1depth_name;
  String? region_2depth_name;
  String? region_3depth_name;
  String? region_3depth_h_name;
  String? h_code;
  String? b_code;
  String? mountain_yn;
  String? main_address_no;
  String? sub_address_no;
  String? zip_code;
  String? x;
  String? y;

  KaKaoAddress({
    this.address_name,
    this.region_1depth_name,
    this.region_2depth_name,
    this.region_3depth_name,
    this.region_3depth_h_name,
    this.h_code,
    this.b_code,
    this.mountain_yn,
    this.main_address_no,
    this.sub_address_no,
    this.zip_code,
    this.x,
    this.y
  });

  factory KaKaoAddress.fromJson(Map<String, dynamic> json) => _$KaKaoAddressFromJson(json);

  Map<String, dynamic> toJson() => _$KaKaoAddressToJson(this);
}

@JsonSerializable()
class KaKaoRoadAddress {
  String? address_name;
  String? region_1depth_name;
  String? region_2depth_name;
  String? region_3depth_name;
  String? road_name;
  String? underground_yn;
  String? main_building_no;
  String? sub_building_no;
  String? building_name;
  String? zone_no;
  String? x;
  String? y;

  KaKaoRoadAddress({
    this.address_name,
    this.region_1depth_name,
    this.region_2depth_name,
    this.region_3depth_name,
    this.road_name,
    this.underground_yn,
    this.main_building_no,
    this.sub_building_no,
    this.building_name,
    this.zone_no,
    this.x,
    this.y
  });

  factory KaKaoRoadAddress.fromJson(Map<String, dynamic> json) => _$KaKaoRoadAddressFromJson(json);

  Map<String, dynamic> toJson() => _$KaKaoRoadAddressToJson(this);

}
