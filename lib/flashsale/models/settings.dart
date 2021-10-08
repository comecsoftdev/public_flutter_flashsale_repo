import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'settings.g.dart';

@JsonSerializable()
class FsSettings{
  @JsonKey(name: 'l3_s_time')
  int? l3STime;
  @JsonKey(name: 'l3_e_time')
  int? l3ETime;
  @JsonKey(name: 'l2_s_time')
  int? l2STime;
  @JsonKey(name: 'l2_e_time')
  int? l2ETime;
  @JsonKey(name: 'addr_ver')
  int? addrVer;
  @JsonKey(name: 'app_ver')
  String? appVer;
  @JsonKey(name: 'max_product_count')
  int? maxProductCount;
  @JsonKey(name: 'distance_limit')
  int? distanceLimit;

  FsSettings({this.l3STime, this.l3ETime, this.l2STime, this.l2ETime, this.addrVer});

  factory FsSettings.fromJson(Map<String, dynamic> json) => _$FsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FsSettingsToJson(this);
}
