// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searching_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchingRule _$SearchingRuleFromJson(Map<String, dynamic> json) {
  return SearchingRule(
    mainRule:
        _$enumDecodeNullable(_$SearchingMaineRuleEnumMap, json['mainRule']),
    distance: json['distance'] as int?,
    district: json['district'] == null
        ? null
        : LocAddress.fromJson(json['district'] as Map<String, dynamic>),
    categories:
        (json['categories'] as List<dynamic>?)?.map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$SearchingRuleToJson(SearchingRule instance) =>
    <String, dynamic>{
      'mainRule': _$SearchingMaineRuleEnumMap[instance.mainRule],
      'distance': instance.distance,
      'district': instance.district,
      'categories': instance.categories,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$SearchingMaineRuleEnumMap = {
  SearchingMaineRule.MyLocationBase: 'MyLocationBase',
  SearchingMaineRule.DistrictBase: 'DistrictBase',
};
