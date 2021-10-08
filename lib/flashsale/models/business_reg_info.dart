import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'business_reg_info.g.dart';

@JsonSerializable()
class BusinessRegInfo{
  int id;
  String? image;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'store_name')
  String? storeName;
  String? rgstID;
  String? address;

  BusinessRegInfo({
    required this.id,
    this.image,
    this.ownerName,
    this.storeName,
    this.rgstID,
    this.address
  });

  factory BusinessRegInfo.fromJson(Map<String, dynamic> json) => _$BusinessRegInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessRegInfoToJson(this);
}