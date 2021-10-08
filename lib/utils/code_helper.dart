import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_codes.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sigv4/sigv4.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';


void closeApp(){
  // quit app in case of Android.
  // Todo. check again in case of iOS.
  if(Platform.isAndroid) {
    SystemNavigator.pop();
  }
}

// hide soft keyboard
void hideSoftKeyboard(context){
  FocusScope.of(context).unfocus();
}

/*
LatLng related functions
 */
// covert string([1,1]) to LatLng
LatLng? convertStringToLatLng(String latlng){
  try{
    dynamic coordinate = jsonDecode(latlng);
    return LatLng(coordinate[0], coordinate[1]);
  }catch(error) {
    return null;
  }
}

// covert string([[1,1], [2,2] ....[n,n]] to List<LatLng>
List<LatLng>? convertStringToLatLngList(String latlngs){
  try{
    List<LatLng> coordinates = [];

    for (dynamic latlng in jsonDecode(latlngs)){
      coordinates.add(LatLng(latlng[0], latlng[1]));
    }

    return coordinates;
  }catch(error) {
    return null;
  }
}

/*
select only the posts within the distance or district based on searchingRule
 */
List<dynamic>? getSelectedPosts(List<dynamic>? posts, double currentLat, double currentLng, SearchingRule rule, List<int>? categories){
  List<dynamic>? selectedPosts;
  if (rule.mainRule == SearchingMaineRule.MyLocationBase){
    selectedPosts = getSelectedPostsWithinDistance(posts!, currentLat, currentLng, rule.distance, categories);
  }else if(rule.mainRule == SearchingMaineRule.DistrictBase){
    selectedPosts = getSelectedPostsWithinDistrict(posts!, currentLat, currentLng, rule.district!.coordinates, categories);
  }

  return selectedPosts;
}

List<dynamic> getSelectedPostsWithinDistance(List<dynamic> posts, double lat, double lng, int? distance, List<int>? categories) {
  List<dynamic> postInCategories = [];
  List<dynamic> result = [];

  posts.forEach((element) {
    if (categories!.contains(element.category)) postInCategories.add(element);
  });

  for (dynamic post in postInCategories){
    double distanceInMeters = Geolocator.distanceBetween(lat, lng, double.parse(post.lat), double.parse(post.lng));

    if (distanceInMeters <= distance!){
      post.distanceFromMe = distanceInMeters;
      result.add(post);
    }
  }

  return result;
}

List<dynamic> getSelectedPostsWithinDistrict(List<dynamic> posts, double lat, double lng, List<LatLng>? coordinates, List<int>? categories) {
  List<dynamic> postInCategories = [];
  List<dynamic> result = [];
  //List<LatLng> coordinates = convertStringToLatLngList(district);

  posts.forEach((element) {
    if (categories!.contains(element.category)) postInCategories.add(element);
  });

  for (dynamic post in postInCategories){
    if (checkIfValidMarker(LatLng(double.parse(post.lat), double.parse(post.lng)), coordinates!)){
      post.distanceFromMe = Geolocator.distanceBetween(lat, lng, double.parse(post.lat), double.parse(post.lng));
      result.add(post);
    }
  }

  return result;
}

// check if latLng point exists in polygon
bool checkIfValidMarker(LatLng point, List<LatLng> vertices) {
  int intersectCount = 0;
  for (int j = 0; j < vertices.length - 1; j++) {
    if (rayCastIntersect(point, vertices[j], vertices[j + 1])) {
      intersectCount++;
    }
  }

  return ((intersectCount % 2) == 1); // odd = inside, even = outside;
}

bool rayCastIntersect(LatLng tap, LatLng vertA, LatLng vertB) {
  double aY = vertA.latitude;
  double bY = vertB.latitude;
  double aX = vertA.longitude;
  double bX = vertB.longitude;
  double pY = tap.latitude;
  double pX = tap.longitude;

  if ((aY > pY && bY > pY) || (aY < pY && bY < pY) || (aX < pX && bX < pX)) {
    return false; // a and b can't both be above or below pt.y, and a or
    // b must be east of pt.x
  }

  double m = (aY - bY) / (aX - bX); // Rise over run
  double bee = (-aX) * m + aY; // y = mx + b
  double x = (pY - bee) / m; // algebra is neat!

  return x > pX;
}

/*
category icon related functions
 */
// load icon of category to display marker on google map
Future<List<BitmapDescriptor>> loadCategoryBitmapDesc(int num) async{
  logger.v('loadCategoryBitmapDesc');

  var completer = Completer<List<BitmapDescriptor>>();

  List<BitmapDescriptor> categoryDesc;

  var list = List<int>.generate(num, (i) => i);

  Iterable<Future<Uint8List>> mappedList = list.map((element) async{
    return await getBytesFromAsset('assets/images/category/$element.png', 80);
  });

  await Future.wait(mappedList).then((value){
    categoryDesc = value.map((element) => BitmapDescriptor.fromBytes(element)).toList();
    completer.complete(categoryDesc);
  });

  return completer.future;
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}

BitmapDescriptor getCategoryBitmapDesc(context, num){
  logger.v('getCategoryBitmapDesc num : $num');
  return (num >= constants.numCategory) ? FSAppState.of(context).categoryDesc[0] : FSAppState.of(context).categoryDesc[num];
}

AssetImage getCategoryAssetImage(num){
  return (num >= constants.numCategory) ? AssetImage('assets/images/category/0.png') : AssetImage('assets/images/category/$num.png');
}

/*
Amazon S3 related function
*/
Map<String, String> getS3Header(String url){
  final client = Sigv4Client(
      region: env['AWS_S3_REGION']!,
      keyId: env['AWS_ACCESS_KEY_ID']!,
      accessKey: env['AWS_SECRET_ACCESS_KEY']!,
      serviceName: "s3",
      //sessionToken: session,
      defaultContentType: "image/*"
  );

  /*
  Problem in sigv4: ^5.0.0-nullsafety.0
  please merge this code in client.signedHeaders()
  
  if (signPayload) {
      headers[_x_amz_content_sha256] = signPayload ? Sigv4.hashPayload(body) : _unsigned_payload;;
    }
  */
  final header = client.signedHeaders(url);

  return header;
}

// https://github.com/flutter/flutter/issues/25107
// Network Image - Connection closed before full header was received
dynamic getCachedNetworkImageProviderFromS3(String url){
  if (url.startsWith('https')) {
    url = url.replaceFirst('https', 'http');
  }

  return CachedNetworkImageProvider(url, headers: getS3Header(url));
}

/*
country code related help functions
 */
String getCountryCode(){
  return Intl.defaultLocale!.substring(3);
}

String? getDialCode(){
  String countCode = getCountryCode();

  List<CountryCode> elements = codes
      .map((s) => CountryCode(
    name: "",
    code: s['code'],
    dialCode: s['dial_code'],
    flagUri: "",
  )).toList();

  String? dialCode = elements.firstWhere((c) => c.code == countCode).dialCode;

  return dialCode;
}

/*
URL_Launcher related functions
*/
void goToAppStore(String packageName) async{
  String url = "market://details?id=" + packageName;
  if (await canLaunch(url)) {
    await launch(url);
  }
}

void goToPhoneApp(String phone) async{
  String url = "tel://$phone";
  if (await canLaunch(url)) {
    await launch(url);
  }
}


String distanceConversion(int meter){
  if (meter >= 1000)
    return (meter~/1000).toString()+'KM';
  else return meter.toString()+'M';
}

//Round up the Date-Time to 10 min interval
DateTime roundWithin10Minutes(DateTime d) {
  // return d.add(Duration(minutes: (d.minute % 10) < 5 ? 0 : 10));
  int addMin = d.minute % 10 == 0 ? 0 : 10 - (d.minute % 10);
  DateTime endTime = d.add(Duration(minutes: addMin));

  if (endTime.hour >= 21) endTime = DateTime(endTime.year, endTime.month, endTime.day, endTime.hour, 0);

  return endTime;
}


// get time format
String getTimeFormatType1(S _s, String created){
  return DateFormat(_s.commonTimeFormat1).format(DateTime.parse(created));
}

String getTimeFormatType2(S _s, String created){
  return DateFormat(_s.commonTimeFormat2).format(DateTime.parse(created));
}

String getTimeFormatType3(S _s, String created){
  return DateFormat(_s.commonTimeFormat3).format(DateTime.parse(created));
}
