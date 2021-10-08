// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) {
  return Store(
    id: json['id'] as int?,
    placeName: json['name'] as String,
    placePhone:
        const CustomPhoneNumberConverter().fromJson(json['phone'] as String),
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    address: json['address'] as String,
    addressDetail: json['address_detail'] as String?,
    carNo: json['car_no'] as String?,
    type: json['type'] as String,
    category: json['category'] as int,
    rgstNo: json['rgstID'] as String,
    level: json['level'] as int?,
    products: (json['product'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
    ratings: json['ratings'] == null
        ? null
        : Ratings.fromJson(json['ratings'] as Map<String, dynamic>),
    homeUrl: json['home_url'] as String?,
    businessReg: json['business_registration'] == null
        ? null
        : BusinessRegInfo.fromJson(
            json['business_registration'] as Map<String, dynamic>),
    tags: const CustomTagsConverter().fromJson(json['tags'] as String?),
    status: json['status'] as int?,
    unAnsweredReviewCount: json['un_count'] as int?,
    ratingCnt: json['rating_cnt'] as int?,
    enableReview: json['enable_rev'] as bool? ?? false,
  )..addressId = json['address_id'] as int?;
}

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.placeName,
      'phone': const CustomPhoneNumberConverter().toJson(instance.placePhone),
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'address_id': instance.addressId,
      'car_no': instance.carNo,
      'type': instance.type,
      'category': instance.category,
      'rgstID': instance.rgstNo,
      'product': instance.products,
      'ratings': instance.ratings,
      'home_url': instance.homeUrl,
      'business_registration': instance.businessReg,
      'level': instance.level,
      'tags': const CustomTagsConverter().toJson(instance.tags),
      'status': instance.status,
      'un_count': instance.unAnsweredReviewCount,
      'rating_cnt': instance.ratingCnt,
      'enable_rev': instance.enableReview,
    };
