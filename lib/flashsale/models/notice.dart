import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'notice.g.dart';

@JsonSerializable()
class Notice {
  int id;
  String type;
  String title;
  String notice;
  String created;
  @JsonKey(defaultValue : false)
  bool? checked;                    //true if user check this notice

  Notice({
    required this.id,
    required this.type,
    required this.title,
    required this.notice,
    required this.created,
    this.checked,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}
