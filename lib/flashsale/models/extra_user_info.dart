import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'extra_user_info.g.dart';

@JsonSerializable()
class ExtraUserInfo{
  @JsonKey(name: 'r_p_time_week')
  int rPostingTimeWeek;

  ExtraUserInfo({
    required this.rPostingTimeWeek
  });

  factory ExtraUserInfo.fromJson(Map<String, dynamic> json) => _$ExtraUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraUserInfoToJson(this);
}