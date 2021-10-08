// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_recipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreRecipient _$StoreRecipientFromJson(Map<String, dynamic> json) {
  return StoreRecipient(
    id: json['id'] as int,
    giver: json['giver'] as String,
    storeId: json['store_id'] as int,
    giverId: json['giver_id'] as int,
  );
}

Map<String, dynamic> _$StoreRecipientToJson(StoreRecipient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'giver': instance.giver,
      'store_id': instance.storeId,
      'giver_id': instance.giverId,
    };
