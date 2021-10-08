import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'searching_rule.g.dart';

enum SearchingMaineRule {
  MyLocationBase,
  DistrictBase,
}

@JsonSerializable()
class SearchingRule {
  SearchingMaineRule? mainRule;                   // LocationBase or RestrictBase
  int? distance;                   // in distance(meter) from my location in case of LocationBase search
  LocAddress? district;                 // LocAddress in case of AreaBase search.
  List<int>? categories;             // category id list to be selected. only subcategory stored.

  SearchingRule({
    this.mainRule = SearchingMaineRule.MyLocationBase,
    this.distance = 1000,
    this.district,
    this.categories,
  });

  factory SearchingRule.fromJson(Map<String, dynamic> json) => _$SearchingRuleFromJson(json);

  Map<String, dynamic> toJson() => _$SearchingRuleToJson(this);

  @override
  String toString(){
    String result = '';

    result += 'mainRule : ' + mainRule.toString() + '\n';
    if (mainRule == SearchingMaineRule.MyLocationBase)
      result += 'distance : ' + distance.toString() + '\n';
    else
      result += 'district : ' + district!.name + '\n';

    return result;
  }
}