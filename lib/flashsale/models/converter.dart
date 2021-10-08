import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:comecsoft/utils/utils.dart';

class CustomPhoneNumberConverter implements JsonConverter<String, String> {
  const CustomPhoneNumberConverter();

  @override
  String fromJson(String json) {
    return json.replaceFirst(getDialCode()!, '0');
  }

  @override
  String toJson(String json){
    return getDialCode()! + json.substring(1);
  }
}

class CustomTagsConverter implements JsonConverter<List<String>?, String?> {
  const CustomTagsConverter();

  @override
  List<String>? fromJson(String? json) {
    if (json == null) return null;

    try{
      List<String> tags = (jsonDecode(json) as List<dynamic>).cast<String>();
      return tags;
    }catch(error) {
      return null;
    }
  }

  @override
  String? toJson(List<String>? json){
    if (json == null) return null;

    try{
      String tags = jsonEncode(json);
      return tags;
    }catch(error) {
      return null;
    }
  }
}

class CustomCoordinatesConverter implements JsonConverter<List<LatLng>?, List<dynamic>?> {
  const CustomCoordinatesConverter();

  @override
  List<LatLng>? fromJson(List<dynamic>? json) {
    if (json == null) return null;

    try{
      List<LatLng> coordinates = json.map((e) => LatLng(e[0], e[1])).toList();
      return coordinates;
    }catch(error) {
      return null;
    }
  }

  @override
  List<dynamic>? toJson(List<LatLng>? json){
    if (json == null) return null;

    try{
      List<dynamic> coordinates = json..map((e) => [e.latitude, e.longitude]).toList();
      return coordinates;
    }catch(error) {
      return null;
    }
  }
}

class CustomCenterConverter implements JsonConverter<LatLng?, List<dynamic>?> {
  const CustomCenterConverter();

  @override
  LatLng? fromJson(List<dynamic>? json) {
    if (json == null) return null;

    try{
      LatLng latLng = LatLng(json[0], json[1]);
      return latLng;
    }catch(error) {
      return null;
    }
  }

  @override
  List<dynamic>? toJson(LatLng? json){
    if (json == null) return null;

    try{
      List<dynamic> latLng = [json.latitude, json.longitude];
      return latLng;
    }catch(error) {
      return null;
    }
  }
}