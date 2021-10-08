import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:comecsoft/flashsale/models/converter.dart';

import 'models.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'store.g.dart';

// please refer to backend model/store's class StoreStatus
class StoreStatus {
  static const int NORMAL = 1;
  static const int LOCKED = 2;
  static const int DELETED = 3;
}

@JsonSerializable()
class Store{
  int? id;
  @JsonKey(name: 'name')
  String placeName;
  @JsonKey(name: 'phone')
  @CustomPhoneNumberConverter()
  String placePhone;
  String lat;
  String lng;
  String address;
  @JsonKey(name: 'address_detail')
  String? addressDetail;
  // Id in LocAddress. Id in server's address table.
  // ID to distinguish 'dong(district)'
  @JsonKey(name: 'address_id')
  int? addressId;
  @JsonKey(name: 'car_no')
  String? carNo;
  // store type : 'Fixed' or 'Moving'
  String? type;
  // store category
  int category;
  @JsonKey(name: 'rgstID')
  String rgstNo;
  @JsonKey(name: 'product')
  List<Product>? products;
  // store ratings ex) "ratings": { "rating4": 1, "rating5": 1 }
  Ratings? ratings;
  @JsonKey(name: 'home_url')
  String? homeUrl;
  // store business registration info if it is registered
  @JsonKey(name: 'business_registration')
  BusinessRegInfo? businessReg;
  // store level will be used later
  int? level;
  // store tags
  @CustomTagsConverter()
  List<String>? tags;
  // store status: NORMAL, LOCKED, DELETED
  int? status;
  // unanswered review count
  @JsonKey(name: 'un_count')
  int? unAnsweredReviewCount;
  // total review count. Same 'rating_cnt' exists in posting.dart also.
  @JsonKey(name: 'rating_cnt')
  int? ratingCnt;
  @JsonKey(name: 'enable_rev', defaultValue: false)
  bool? enableReview;

  Store({
    required this.id,
    required this.placeName,
    required this.placePhone,
    required this.lat,
    required this.lng,
    required this.address,
    this.addressDetail,
    this.carNo,
    required String this.type,
    required this.category,
    required this.rgstNo,
    required this.level,
    this.products,
    this.ratings,
    this.homeUrl,
    this.businessReg,
    this.tags,
    this.status,
    this.unAnsweredReviewCount,
    this.ratingCnt,
    this.enableReview
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  factory Store.empty() => Store(
    id: null,
    type: 'FIXED',
    placeName: (env['TEST_STORE_NAME'] != null) ? env['TEST_STORE_NAME']! : '',
    placePhone: (env['TEST_STORE_PHONE_NUMBER'] != null) ? env['TEST_STORE_PHONE_NUMBER']! : '',
    lat: '',
    lng: '',
    address: (env['TEST_STORE_ADDRESS'] != null) ? env['TEST_STORE_ADDRESS']! : '',
    addressDetail: (env['TEST_STORE_ADDRESS_DETAIL'] != null) ? env['TEST_STORE_ADDRESS_DETAIL']! : '',
    carNo: (env['TEST_STORE_CAR_NUMBER'] != null) ? env['TEST_STORE_CAR_NUMBER']! : '',
    category: 0,
    rgstNo: (env['TEST_STORE_RGST_NUMBER'] != null) ? env['TEST_STORE_RGST_NUMBER']! : '',
    businessReg: null,
    level: 1,
    tags: [],
  );

  factory Store.clone(store) => Store(
    id: store.id,
    type: store.type,
    placeName: store.placeName,
    placePhone: store.placePhone,
    lat: store.lat,
    lng: store.lng,
    address: store.address,
    addressDetail: store.addressDetail,
    carNo: store.carNo,
    category: store.category,
    rgstNo: store.rgstNo,
    businessReg: store.businessReg,
    level: store.level,
    tags: store.tags ?? [],
    status: store.status,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Store &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          placeName == other.placeName &&
          placePhone == other.placePhone &&
          lat == other.lat &&
          lng == other.lng &&
          address == other.address &&
          addressDetail == other.addressDetail &&
          carNo == other.carNo &&
          type == other.type &&
          category == other.category &&
          rgstNo == other.rgstNo &&
          products == other.products &&
          ratings == other.ratings &&
          homeUrl == other.homeUrl &&
          businessReg == other.businessReg &&
          level == other.level &&
          status == other.status &&
          listEquals(tags, other.tags);

  @override
  int get hashCode =>
      id.hashCode ^
      placeName.hashCode ^
      placePhone.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      address.hashCode ^
      addressDetail.hashCode ^
      carNo.hashCode ^
      type.hashCode ^
      category.hashCode ^
      rgstNo.hashCode ^
      products.hashCode ^
      ratings.hashCode ^
      homeUrl.hashCode ^
      businessReg.hashCode ^
      level.hashCode ^
      status.hashCode ^
      tags.hashCode;
}