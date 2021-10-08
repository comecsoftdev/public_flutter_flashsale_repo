import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'store_giver.g.dart';

@JsonSerializable()
class StoreGiver{
  int id;
  String recipient;
  @JsonKey(name: 'store_id')
  int storeId;

  StoreGiver({
    required this.id,
    required this.recipient,
    required this.storeId,
  });

  factory StoreGiver.fromJson(Map<String, dynamic> json) => _$StoreGiverFromJson(json);

  Map<String, dynamic> toJson() => _$StoreGiverToJson(this);
}