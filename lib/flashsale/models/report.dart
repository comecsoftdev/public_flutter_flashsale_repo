import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'report.g.dart';

@JsonSerializable()
class StoreReport {
  int id;
  @JsonKey(name: 'store_id')
  int store;
  int report;
  String created;

  StoreReport({
    required this.id,
    required this.store,
    required this.report,
    required this.created,
  });

  factory StoreReport.fromJson(Map<String, dynamic> json) => _$StoreReportFromJson(json);

  Map<String, dynamic> toJson() => _$StoreReportToJson(this);
}
