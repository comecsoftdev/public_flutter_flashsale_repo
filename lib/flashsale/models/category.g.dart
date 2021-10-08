// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    name: json['name'] as String,
    id: json['id'] as int,
    items: json['items'] as String?,
    abbr: json['abbr'] as String?,
    value: json['value'] as bool?,
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'abbr': instance.abbr,
      'items': instance.items,
      'id': instance.id,
      'value': instance.value,
      'children': instance.children,
    };
