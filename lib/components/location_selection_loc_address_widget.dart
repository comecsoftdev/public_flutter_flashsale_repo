import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';

class LocationSelectionLocAddressWidget extends StatefulWidget {
  final void Function(dynamic node) onTap;
  final List<LocAddress> locAddresses;

  LocationSelectionLocAddressWidget({
    Key? key,
    required this.onTap,
    required this.locAddresses,
  }) : super(key: key);

  @override
  LocationSelectionLocAddressWidgetState createState() => LocationSelectionLocAddressWidgetState();
}

class LocationSelectionLocAddressWidgetState extends State<LocationSelectionLocAddressWidget>{
  S? _s;

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Container(
      width: 300.w,
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        boxShadow: [
          BoxShadow(
            color: AppColor.color1013,
            blurRadius: 8,
            offset: Offset(0, -4),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
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
            SizedBox(height: 5.h,),
            Container(
              width: double.infinity,
              height: 2.h,
              color: AppColor.color1014,
            ),
            (widget.locAddresses.length > 0) ?
            // [ select location ]
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.h),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: widget.locAddresses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        widget.onTap.call(widget.locAddresses[widget.locAddresses.length - index - 1]);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Container(
                            height: 45.h,
                            width: 260.w,
                            child: Text(
                              widget.locAddresses[widget.locAddresses.length - index - 1].name,
                              style: TextStyle(
                                color: AppColor.color1010,
                                fontSize: 17.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ) :
            // [ There are no locations available for selection ]
            Container(
              padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 260.w,
                    child: Text(
                      _s!.homeNoLocationAvailable,
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 17.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}