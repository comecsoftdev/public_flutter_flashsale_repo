import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'store_recipient.g.dart';

@JsonSerializable()
class StoreRecipient{
  int id;
  String giver;
  @JsonKey(name: 'store_id')
  int storeId;
  @JsonKey(name: 'giver_id')
  int giverId;

  StoreRecipient({
    required this.id,
    required this.giver,
    required this.storeId,
    required this.giverId,
  });

  factory StoreRecipient.fromJson(Map<String, dynamic> json) => _$StoreRecipientFromJson(json);

  Map<String, dynamic> toJson() => _$StoreRecipientToJson(this);
}