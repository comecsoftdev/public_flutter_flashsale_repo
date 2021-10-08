import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String email;
  final String? photoUrl;

  User({
    required this.name,
    required this.email,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}