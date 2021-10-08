// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int?,
    image: json['image'] as String?,
    thumbnail: json['thumbnail'] as String?,
    name: json['name'] as String,
    comment: json['comment'] as String?,
    price: json['price'] as int,
    dPrice: json['d_price'] as int,
    dRate: json['d_rate'] as int,
    active: json['active'] as bool,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
      'name': instance.name,
      'comment': instance.comment,
      'price': instance.price,
      'd_price': instance.dPrice,
      'd_rate': instance.dRate,
      'active': instance.active,
    };
