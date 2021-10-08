// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posting _$PostingFromJson(Map<String, dynamic> json) {
  return Posting(
    id: json['id'] as int?,
    store: json['store'] as int,
    category: json['category'] as int,
    name: json['name'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    validity: json['validity'] as String,
    type: json['type'] as String,
    distanceFromMe: (json['distanceFromMe'] as num?)?.toDouble(),
    address: json['address'] as String?,
    addressDetail: json['address_detail'] as String?,
    carNo: json['car_no'] as String?,
    ratingAvg: json['rating_avg'] as String?,
    ratingCnt: json['rating_cnt'] as int?,
    created: json['created'] as String?,
    productImage: json['p_image'] as String,
    productCount: json['p_count'] as int,
    productDRate: json['p_d_rate'] as int,
  )..tags = const CustomTagsConverter().fromJson(json['tags'] as String?);
}

Map<String, dynamic> _$PostingToJson(Posting instance) => <String, dynamic>{
      'id': instance.id,
      'store': instance.store,
      'category': instance.category,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'validity': instance.validity,
      'distanceFromMe': instance.distanceFromMe,
      'type': instance.type,
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'car_no': instance.carNo,
      'rating_avg': instance.ratingAvg,
      'rating_cnt': instance.ratingCnt,
      'created': instance.created,
      'p_image': instance.productImage,
      'p_count': instance.productCount,
      'p_d_rate': instance.productDRate,
      'tags': const CustomTagsConverter().toJson(instance.tags),
    };
