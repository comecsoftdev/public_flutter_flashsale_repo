import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'rating.g.dart';

@JsonSerializable()
class Rating{
  int? id;
  int? rating;

  Rating({this.id, this.rating});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class Ratings {
  int? rating1;
  int? rating2;
  int? rating3;
  int? rating4;
  int? rating5;

  Ratings({this.rating1, this.rating2, this.rating3, this.rating4, this.rating5});

  factory Ratings.fromJson(Map<String, dynamic> json) => _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);

  Map<String, int> ratingsToSimpleMap() => <String, int>{
    '1': rating1 ?? 0,
    '2': rating2 ?? 0,
    '3': rating3 ?? 0,
    '4': rating4 ?? 0,
    '5': rating5 ?? 0,
  };
}