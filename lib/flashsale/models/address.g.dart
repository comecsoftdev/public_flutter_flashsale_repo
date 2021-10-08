// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressBook _$AddressBookFromJson(Map<String, dynamic> json) {
  return AddressBook(
    ver: json['ver'] as int,
    addr: (json['addr'] as List<dynamic>)
        .map((e) => LocAddress.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AddressBookToJson(AddressBook instance) =>
    <String, dynamic>{
      'ver': instance.ver,
      'addr': instance.addr,
    };

LocAddress _$LocAddressFromJson(Map<String, dynamic> json) {
  return LocAddress(
    name: json['name'] as String,
    id: json['id'] as int,
    isLeaf: json['isLeaf'] as bool?,
    level: json['level'] as int?,
    value: json['value'] as bool?,
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => LocAddress.fromJson(e as Map<String, dynamic>))
        .toList(),
    coordinates: const CustomCoordinatesConverter()
        .fromJson(json['coordinates'] as List?),
    center: const CustomCenterConverter().fromJson(json['center'] as List?),
  );
}

Map<String, dynamic> _$LocAddressToJson(LocAddress instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'isLeaf': instance.isLeaf,
      'level': instance.level,
      'value': instance.value,
      'children': instance.children,
      'coordinates':
          const CustomCoordinatesConverter().toJson(instance.coordinates),
      'center': const CustomCenterConverter().toJson(instance.center),
    };
