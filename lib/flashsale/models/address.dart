import 'package:flutter/cupertino.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:comecsoft/flashsale/models/converter.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example
// flutter packages pub run build_runner build
// https://github.com/flutter/flutter/issues/56779

part 'address.g.dart';

@JsonSerializable()
class AddressBook{
  final int ver;
  final List<LocAddress> addr;

  AddressBook({
    required this.ver,
    required this.addr,
  });

  factory AddressBook.fromJson(Map<String, dynamic> json) => _$AddressBookFromJson(json);

  Map<String, dynamic> toJson() => _$AddressBookToJson(this);
}

@JsonSerializable()
class LocAddress {
  final String name;
  final int id;
  final bool? isLeaf;
  final int? level;
  bool? value;
  final List<LocAddress>? children;
  @CustomCoordinatesConverter()
  final List<LatLng>? coordinates;
  @CustomCenterConverter()
  final LatLng? center;

  LocAddress({
    required this.name,
    required this.id,
    this.isLeaf = false,
    this.level = 0,
    this.value = true,
    this.children = const <LocAddress>[],
    this.coordinates,
    this.center,
  });

  factory LocAddress.fromJson(Map<String, dynamic> json) => _$LocAddressFromJson(json);

  Map<String, dynamic> toJson() => _$LocAddressToJson(this);

  static TreeNode toTreeNode(LocAddress address){
    TreeNode treeNode = TreeNode(
      content: Text(address.name),
      key: Key(address.id.toString()),
      children: (address.children != null) ? address.children!.map((item) => LocAddress.toTreeNode(item)).toList() : null,
    );

    return treeNode;
  }

  static bool findAddressId(LocAddress address, int? addressId){
    if(address.id == addressId) return true;
    if (address.children != null)
      for(var addr in address.children!)
        if (LocAddress.findAddressId(addr, addressId)) return true;

    return false;
  }
}