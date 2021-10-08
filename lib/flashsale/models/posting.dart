import 'package:json_annotation/json_annotation.dart';

import 'package:comecsoft/flashsale/models/converter.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'posting.g.dart';

@JsonSerializable()
class Posting {
  int? id;
  int store;
  int category;
  String? name;
  String lat;
  String lng;
  String? validity;
  double? distanceFromMe;
  String type;
  String? address;
  @JsonKey(name: 'address_detail')
  String? addressDetail;
  @JsonKey(name: 'car_no')
  String? carNo;
  @JsonKey(name: 'rating_avg')
  String? ratingAvg;
  @JsonKey(name: 'rating_cnt')
  int? ratingCnt;
  String? created;
  @JsonKey(name: 'p_image')
  String productImage;
  @JsonKey(name: 'p_count')
  int productCount;
  @JsonKey(name: 'p_d_rate')
  int productDRate;
  @CustomTagsConverter()
  List<String>? tags;

  Posting({
    required this.id,
    required this.store,
    required this.category,
    required String this.name,
    required this.lat,
    required this.lng,
    required String this.validity,
    required this.type,
    this.distanceFromMe,
    this.address,
    this.addressDetail,
    this.carNo,
    this.ratingAvg,
    this.ratingCnt,
    this.created,
    required this.productImage,
    required this.productCount,
    required this.productDRate,
  });

  factory Posting.fromJson(Map<String, dynamic> json) => _$PostingFromJson(json);

  Map<String, dynamic> toJson() => _$PostingToJson(this);

  factory Posting.empty() => Posting(
    id: null,
    store: 0,
    category: 0,
    name: '',
    lat: '',
    lng: '',
    validity: '',
    type: '',
    created: '',
    productImage: '',
    productCount: 0,
    productDRate: 0,
  );

  factory Posting.clone(post) => Posting(
    id: post.id,
    store: post.store,
    category: post.category,
    name: post.name,
    lat: post.lat,
    lng: post.lng,
    validity: post.validity,
    distanceFromMe: post.distanceFromMe,
    type: post.type,
    address: post.address,
    addressDetail: post.addressDetail,
    carNo: post.carNo,
    ratingAvg: post.ratingAvg,
    ratingCnt: post.ratingCnt,
    created: post.created,
    productImage: post.productImage,
    productCount: post.productCount,
    productDRate: post.productDRate,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Posting &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          store == other.store &&
          category == other.category &&
          name == other.name &&
          lat == other.lat &&
          lng == other.lng &&
          validity == other.validity &&
          distanceFromMe == other.distanceFromMe &&
          type == other.type &&
          address == other.address &&
          addressDetail == other.addressDetail &&
          carNo == other.carNo &&
          ratingAvg == other.ratingAvg &&
          ratingCnt == other.ratingCnt &&
          created == other.created &&
          productImage == other.productImage &&
          productCount == other.productCount &&
          productDRate == other.productDRate;

  @override
  int get hashCode =>
      id.hashCode ^
      store.hashCode ^
      category.hashCode ^
      name.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      validity.hashCode ^
      distanceFromMe.hashCode ^
      type.hashCode ^
      address.hashCode ^
      addressDetail.hashCode ^
      carNo.hashCode ^
      ratingAvg.hashCode ^
      ratingCnt.hashCode ^
      created.hashCode ^
      productImage.hashCode ^
      productCount.hashCode ^
      productDRate.hashCode;
}
