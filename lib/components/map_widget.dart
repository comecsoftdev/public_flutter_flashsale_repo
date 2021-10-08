import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluster/fluster.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;

enum MapPurpose {
  homeMap,                // used in home screen
  confirmLocMap,         // used for confirming location
  selectLocMap,          // used for selecting location
}

class MapWidget extends StatefulWidget {
  final LatLng center;
  final double zoom;
  final MapPurpose mapPurpose;
  final void Function(List<dynamic> postings)? onTap;        // callback on marker

  const MapWidget({
    Key? key,
    required this.center,
    this.zoom = 14.0,
    this.mapPurpose = MapPurpose.homeMap,
    this.onTap,
  }) : super(key: key);

  @override
  MapWidgetState createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget>{
  Completer<GoogleMapController> mapController = Completer();
  late Set<Marker> _centerMarker;                      // for checking center location

  /*
  dynamic type of List<dynamic> posts
  has int id, String lat, String lng, int category, double distanceFromMe

  List<dynamic>     -->      List<dynamic>     -->      List<MapMarker>     -->    Fluster<MapMarker>     -->     List<Marker>
  postings          -->      _selectedPosts    -->      _mapMarkers         -->     _fluster             -->     _googleMarkers
  */
  List<dynamic>? _selectedPosts;
  final List<MapMarker> _mapMarkers = [];
  Fluster<MapMarker>? _fluster;
  List<Marker> _googleMarkers = [];             // to display location & cluster markers  on google map

  Map<CircleId, Circle> _circles = <CircleId, Circle>{};
  Map<PolygonId, Polygon> _polygons = <PolygonId, Polygon>{};
  LatLng? _currentPosition;

  late double _currentZoom;
  LatLng? _center;


  LatLng? get center => _center;
  LatLng? get currentPosition => _currentPosition;
  List<dynamic>? get selectedPostings => _selectedPosts;

  @override
  void initState() {
    super.initState();
    _currentZoom = widget.zoom;
    _center = widget.center;

    if (widget.mapPurpose == MapPurpose.confirmLocMap || widget.mapPurpose == MapPurpose.selectLocMap)
      _centerMarker = Set.from([Marker(markerId: MarkerId('center'), position: _center!, icon: BitmapDescriptor.defaultMarker,)]);
  }

  Future<void> _onMapCreated(GoogleMapController controller) async{
    mapController.complete(controller);
  }

  // May be called as often as every frame, so just track the last zoom value.
  void _onCameraMove(CameraPosition cameraPosition) {
    //logger.v('${this.runtimeType} _onCameraMove');
    _currentZoom = cameraPosition.zoom;
  }

  void _onCameraIdle() {
    //logger.v('${this.runtimeType} _onCameraIdle');
    _displayMarker();
  }

  // for MapPurpose.selectLocMap
  void _onTap(LatLng point) {
    //logger.v('${this.runtimeType} _onTap');
    _center = point;
    setState(() {
      _centerMarker = Set.from([Marker(markerId: MarkerId('center'), position: _center!, icon: BitmapDescriptor.defaultMarker,)]);
    });
  }

  @override
  Widget build(BuildContext context) {
    //logger.v('${this.runtimeType} build');
    return Builder(
      builder: (context){
        return Center(
          child: GoogleMap(
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              new Factory<OneSequenceGestureRecognizer>(() => new EagerGestureRecognizer(),),
            ].toSet(),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            onCameraMove: _onCameraMove,
            onCameraIdle: _onCameraIdle,
            onTap: (widget.mapPurpose == MapPurpose.selectLocMap) ? _onTap : null,
            initialCameraPosition: CameraPosition(
              target: _center!,
              zoom: _currentZoom,
            ),
            myLocationEnabled: true,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            rotateGesturesEnabled: false,
            zoomControlsEnabled: false,
            markers: (widget.mapPurpose == MapPurpose.confirmLocMap || widget.mapPurpose == MapPurpose.selectLocMap) ?
            _centerMarker : _googleMarkers.toSet(),
            circles: Set<Circle>.of(_circles.values),
            polygons: Set<Polygon>.of(_polygons.values),
          ),
        );
      },
    );
  }

  Future<void> goToLocation(LatLng? latLng) async {
    if (latLng != null){
      GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, _currentZoom));
    }
  }

  void updateMarker(List<dynamic>? posts, SearchingRule rule) async{
    logger.v('${this.runtimeType} updateMarker');

    _mapMarkers.clear();

    _selectedPosts = getSelectedPosts(posts, _currentPosition!.latitude, _currentPosition!.longitude, rule, rule.categories);

    _selectedPosts?.forEach((element) {
      _mapMarkers.add(
        MapMarker(
          id: element.id.toString(),
          position: LatLng(double.parse(element.lat), double.parse(element.lng)),
          //icon: BitmapDescriptor.defaultMarker,
          icon: getCategoryBitmapDesc(context, element.category),
        ),
      );
    });

    _displayMarker();
  }

  void _displayMarker() async {
    logger.v('${this.runtimeType} _displayMarker zoom $_currentZoom');

    _fluster = MapHelper.initClusterManager(_mapMarkers, 0, 21);

    _googleMarkers = await MapHelper.getClusterMarkers(
      _fluster,
      _currentZoom,
      AppColor.color1017,
      AppColor.color101,
      70,
      _markerTapped,
    );

    setState(() {
    });
  }

  void _markerTapped(MapMarker marker){
    List<dynamic> postings = [];

    logger.v('${this.runtimeType} _markerTapped ' + marker.id);

    if (marker.isCluster!) {
      List<MapMarker> childMapMarkers = _fluster!.points(marker.clusterId!);

      // change List<MapMarker> to List<dynamic>
      childMapMarkers.forEach((e) {
        Posting posting = _selectedPosts!.firstWhere((p) => p.id == int.parse(e.id));
        postings.add(posting);
      });
    }else{
      // change MapMarker to List<dynamic>
      Posting posting = _selectedPosts!.firstWhere((p) => p.id == int.parse(marker.id));
      postings.add(posting);
    }

    widget.onTap?.call(postings);
  }

  void updateMyLocation(LatLng? position, List<dynamic>? posts, SearchingRule rule) {
    logger.v('${this.runtimeType} updateMyLocation $position');

    _currentPosition = position;
    _circles.clear();
    _polygons.clear();

    if (rule.mainRule == SearchingMaineRule.MyLocationBase){
      final CircleId circleId = CircleId('MyLocation');

      _circles[circleId] = Circle(
        circleId: CircleId('MyLocation'),
        center: LatLng(position!.latitude, position.longitude),
        radius: rule.distance!.toDouble(),
        strokeColor: AppColor.color1005,
        fillColor: AppColor.color1005,
        strokeWidth: 0,
      );
    }else if (rule.mainRule == SearchingMaineRule.DistrictBase){
      final PolygonId polygonId = PolygonId(rule.district!.id.toString());

      _polygons[polygonId] = Polygon(
        polygonId: PolygonId(rule.district!.id.toString()),
        //points: convertStringToLatLngList(rule.district.coordinates),
        points: rule.district!.coordinates!,
        strokeColor: AppColor.color701,
        fillColor: AppColor.color1005,
        strokeWidth: 2,
      );
    }

    if (posts != null ) updateMarker(posts, rule);
  }

  void setMapStyle(String style) async{
    GoogleMapController controller = await mapController.future;
    controller.setMapStyle(style);
  }

  void setCurrentPosition(LatLng value) {
    _currentPosition = value;
  }

  void updateMyHeading(double heading) {
    //logger.d('MapWidgetState updateMyHeading ' + heading.toString() );
  }
}

