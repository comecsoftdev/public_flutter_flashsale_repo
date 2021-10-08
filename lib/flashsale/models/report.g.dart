// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreReport _$StoreReportFromJson(Map<String, dynamic> json) {
  return StoreReport(
    id: json['id'] as int,
    store: json['store_id'] as int,
    report: json['report'] as int,
    created: json['created'] as String,
  );
}

Map<String, dynamic> _$StoreReportToJson(StoreReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_id': instance.store,
      'report': instance.report,
      'created': instance.created,
    };
