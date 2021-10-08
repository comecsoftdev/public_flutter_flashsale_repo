import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String name;
  final String? abbr;
  final String? items;
  final int id;
  bool? value;
  final List<Category>? children;

  Category({
    required this.name,
    required this.id,
    this.items,
    this.abbr,
    this.value = false,
    this.children = const <Category>[],
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  // convert recursive category to Map<id, name>
  // This will be helpful to find category name with category id.
  static void createCategoryMap(Category category, Map map){
    map[category.id] = category;

    category.children?.forEach((element){
      createCategoryMap(element, map);
    });
  }
}