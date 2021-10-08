import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;

// checkLocation and confirmLocation have no difference
enum LocationCheckType {
  checkLocation,                // used for just checking location
  confirmLocation,         // used for confirming location
  selectLocation,          // used for selecting location
}

// page for checking location only
class FSLocationPage extends StatefulWidget {
  final LatLng latLng;
  final LocationCheckType locationCheckType;

  FSLocationPage({Key? key,
    required this.latLng,
    required this.locationCheckType,
  }) : super(key: key);

  @override
  FSLocationPageState createState() => FSLocationPageState();
}

class FSLocationPageState extends State<FSLocationPage> {
  GlobalKey<MapWidgetState> _locationMapScreenKey = new GlobalKey();

  GlobalKey<MapWidgetState> get locationMapScreenKey => _locationMapScreenKey;
  S? _s;                     //application localization

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Stack(
                children: [
                  MapWidget(
                    key: _locationMapScreenKey,
                    center: widget.latLng, zoom: 17, mapPurpose: _checkMapPurpose(),
                  ),
                  (widget.locationCheckType == LocationCheckType.selectLocation) ? Positioned(
                    top: 24.h,
                    left: 20.w,
                    child: Container(
                      width: 335.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.color1016,
                            blurRadius: 4.r,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: AppColor.color1021,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text(
                            _s!.commonSelectCorrectLocation,
                            style: TextStyle(
                              color: AppColor.color1010,
                              fontSize: 15.sp,
                              fontFamily: "SpoqaHanSansNeo",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ) : Container(),
                  (widget.locationCheckType == LocationCheckType.selectLocation) ?
                  Positioned(
                    top: 670.h,
                    left: 126.w,
                    child: FSButton(
                      width: 122.w,
                      height: 40.h,
                      borderRadius: 8.r,
                      borderColor: AppColor.color1019,
                      buttonColor: AppColor.color1019,
                      text: _s!.commonSelectDone,
                      textColor: AppColor.color101,
                      fontSize: 16.sp,
                      onTap: (){
                        double lat = _locationMapScreenKey.currentState!.center!.latitude;
                        double lng = _locationMapScreenKey.currentState!.center!.longitude;
                        Navigator.of(context).pop(LatLng(lat, lng));
                      },
                    ),
                  ) :
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return HeaderBarWidget(
      title: _s!.commonLocationCheck,
    );
  }

  MapPurpose _checkMapPurpose(){
    if (widget.locationCheckType == LocationCheckType.checkLocation || widget.locationCheckType == LocationCheckType.confirmLocation)
      return MapPurpose.confirmLocMap;
    else return MapPurpose.selectLocMap;
  }
}