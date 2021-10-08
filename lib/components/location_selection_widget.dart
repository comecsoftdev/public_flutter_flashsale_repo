import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';

enum LocationSelectionType {
  MyLocation,
  LocationHistory,
  LocationDirect,
}

class LocationSelectionWidget extends StatefulWidget {
  // callback function on menu tap
  final void Function(LocationSelectionType) onTap;

  LocationSelectionWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _LocationSelectionWidgetState createState() => _LocationSelectionWidgetState();
}

class _LocationSelectionWidgetState extends State<LocationSelectionWidget>{
  S? _s;

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Container(
      width: 1.sw,
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        boxShadow: [
          BoxShadow(
            color: AppColor.color1013,
            blurRadius: 8.r,
            offset: Offset(0, -4),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
        child: Column(
          children: [
            // [ Please select a location ]
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(
                  _s!.homeSelectLocation,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 18.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8.w),
                Spacer(),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 24.r,
                    height: 24.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon/close.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            // [ set to current location ]
            InkWell(
              onTap: () => widget.onTap(LocationSelectionType.MyLocation),
              child: Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  border: Border.all(color: AppColor.color1009, width: 1.w, ),
                  color: AppColor.color101,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      _s!.homeSetCurrentLocation,
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
            ),
            SizedBox(height: 10.h,),
            // [ previously selected location ]
            InkWell(
              onTap: () => widget.onTap(LocationSelectionType.LocationHistory),
              child: Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  border: Border.all(color: AppColor.color1009, width: 1.w, ),
                  color: AppColor.color101,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      _s!.homePreSelectedLocation,
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 15.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            // [ direct location selection ]
            InkWell(
              onTap: () => widget.onTap(LocationSelectionType.LocationDirect),
              child: Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  border: Border.all(color: AppColor.color1009, width: 1.w, ),
                  color: AppColor.color101,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      _s!.homeDirectLocationSelection,
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 15.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}