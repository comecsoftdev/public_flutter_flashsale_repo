import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:comecsoft/flashsale/models/converter.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'store_owner.g.dart';

@JsonSerializable()
class StoreOwner{
  int? id;
  @JsonKey(name: 'name')
  String? ownerName;
  @JsonKey(name: 'phone')
  @CustomPhoneNumberConverter()
  String ownerPhone;

  StoreOwner({
    required this.id,
    required this.ownerName,
    required this.ownerPhone
  }):   assert(ownerName != null);

  factory StoreOwner.fromJson(Map<String, dynamic> json) => _$StoreOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$StoreOwnerToJson(this);

  factory StoreOwner.empty() => StoreOwner(
    id: null,
    ownerName: (env['TEST_STORE_OWNER_NAME'] != null) ? env['TEST_STORE_OWNER_NAME']! : '',
    ownerPhone: '',
  );

  factory StoreOwner.clone(owner) => StoreOwner(
    id: owner.id,
    ownerPhone: owner.ownerPhone,
    ownerName: owner.ownerName,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreOwner &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          ownerName == other.ownerName &&
          ownerPhone == other.ownerPhone;

  @override
  int get hashCode => id.hashCode ^ ownerName.hashCode ^ ownerPhone.hashCode;
}