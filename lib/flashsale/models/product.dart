import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'product.g.dart';

@JsonSerializable()
class Product{
  int? id;
  String? image;
  String? thumbnail;
  String? name;
  String? comment;
  int price;
  @JsonKey(name: 'd_price')
  int dPrice;
  @JsonKey(name: 'd_rate')
  int dRate;
  bool active;

  Product({
    required this.id,
    this.image,
    this.thumbnail,
    required String this.name,
    this.comment,
    required this.price,
    required this.dPrice,
    required this.dRate,
    required this.active
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.empty() => Product(
    id: null,
    image: null,
    thumbnail: null,
    name: (env['TEST_PRODUCT_NAME'] != null) ? env['TEST_PRODUCT_NAME']! : '',
    comment: (env['TEST_PRODUCT_COMMENT'] != null) ? env['TEST_PRODUCT_COMMENT']! : '',
    price: int.parse((env['TEST_PRODUCT_PRICE'] != null) ? env['TEST_PRODUCT_PRICE']! : '0'),
    dPrice: int.parse((env['TEST_PRODUCT_D_PRICE'] != null) ? env['TEST_PRODUCT_D_PRICE']! : '0'),
    dRate: 0,
    active: false,
  );

  factory Product.clone(product) => Product(
    id: product.id,
    image: product.image,
    thumbnail: product.thumbnail,
    name: product.name,
    comment: product.comment,
    price: product.price,
    dPrice: product.dPrice,
    dRate: product.dRate,
    active: product.active,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Product &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              image == other.image &&
              thumbnail == other.thumbnail &&
              name == other.name &&
              comment == other.comment &&
              price == other.price &&
              dPrice == other.dPrice &&
              dRate == other.dRate &&
              active == other.active;

  @override
  int get hashCode =>
      id.hashCode ^
      image.hashCode ^
      thumbnail.hashCode ^
      name.hashCode ^
      comment.hashCode ^
      price.hashCode ^
      dPrice.hashCode ^
      dRate.hashCode ^
      active.hashCode;

}