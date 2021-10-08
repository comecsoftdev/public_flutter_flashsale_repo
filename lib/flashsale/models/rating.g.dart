// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating(
    id: json['id'] as int?,
    rating: json['rating'] as int?,
  );
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
    };

Ratings _$RatingsFromJson(Map<String, dynamic> json) {
  return Ratings(
    rating1: json['rating1'] as int?,
    rating2: json['rating2'] as int?,
    rating3: json['rating3'] as int?,
    rating4: json['rating4'] as int?,
    rating5: json['rating5'] as int?,
  );
}

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'rating1': instance.rating1,
      'rating2': instance.rating2,
      'rating3': instance.rating3,
      'rating4': instance.rating4,
      'rating5': instance.rating5,
    };
