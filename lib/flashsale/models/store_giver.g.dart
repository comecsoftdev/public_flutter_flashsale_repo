// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_giver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreGiver _$StoreGiverFromJson(Map<String, dynamic> json) {
  return StoreGiver(
    id: json['id'] as int,
    recipient: json['recipient'] as String,
    storeId: json['store_id'] as int,
  );
}

Map<String, dynamic> _$StoreGiverToJson(StoreGiver instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipient': instance.recipient,
      'store_id': instance.storeId,
    };
