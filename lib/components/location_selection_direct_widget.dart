import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/components/components.dart';

class LocationSelectionDirectWidget extends StatefulWidget {
  final void Function(dynamic node) onTap;
  /*dynamic type of node has id(int), name(string) and children.
  * id & name is mandatory, children is optional*/
  final List<LocAddress> nodes;

  LocationSelectionDirectWidget({
    Key? key,
    required this.onTap,
    required this.nodes,
  }) : super(key: key);

  @override
  LocationSelectionDirectWidgetState createState() => LocationSelectionDirectWidgetState();
}

class LocationSelectionDirectWidgetState extends State<LocationSelectionDirectWidget>{
  S? _s;

  LocAddress? _directLoc1;
  LocAddress? _directLoc2;

  @override
  void initState() {
    super.initState();
    _directLoc1 = widget.nodes[0];
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Container(
      width: 1.sh,
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        boxShadow: [
          BoxShadow(
            color: AppColor.color1013,
            blurRadius: 8,
            offset: Offset(0, -4),
          ),
        ],
        color: AppColor.color101,
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
                SizedBox(width: 8.w,),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.help,
                    color: AppColor.color1008,
                    size: 20,
                  ),
                  onPressed: (){
                    showAlertDialog(context,
                      _s!.homeDirectLocationSelection,
                      _s!.homeHelpDirectLocationSelection,
                      yes: _s!.commonOK,
                      yesOnPressed: () => Navigator.pop(context),
                      descTextAlign: TextAlign.left,
                    );
                  },
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
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _s!.homeDirectLocationSelection,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Container(
              width: double.infinity,
              height: 2.h,
              color: AppColor.color1014,
            ),
            SizedBox(height: 15.h,),
            // [ area selection ]
            Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: AppColor.color1009, width: 1.w, ),
                color: AppColor.color101,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h, ),
              child: InkWell(
                onTap: () async{
                  final result = await showSideSheetAsync(
                    context: context,
                    content: LocationSelectionLocAddressWidget(
                      locAddresses: widget.nodes,
                      onTap: (selected){
                        Navigator.pop(context, selected);
                      },
                    ),
                    width: 300.w,
                    height: 300.h,
                    bottom: 10.h,
                    barrierColor: AppColor.color90,
                  );

                  setState(() {
                    _directLoc1 = result ?? _directLoc1;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      _directLoc1?.name ?? _s!.searchingRuleAreaSelection,
                      style: TextStyle(
                        color: AppColor.color1010,
                        fontSize: 16.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 16.r,
                      height: 16.r,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/icon/arrow_drop_down2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            // [ Detailed area selection ]
            Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: AppColor.color1009, width: 1.w, ),
                color: AppColor.color101,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h, ),
              child: InkWell(
                onTap: () async{
                  if (_directLoc1 != null){
                    final result = await showSideSheetAsync(
                      context: context,
                      content: LocationSelectionLocAddressWidget(
                        locAddresses: _directLoc1!.children!,
                        onTap: (selected){
                          Navigator.pop(context, selected);
                        },
                      ),
                      width: 300.w,
                      height: 300.h,
                      bottom: 10.h,
                      barrierColor: AppColor.color90,
                    );

                    setState(() {
                      _directLoc2 = result ?? _directLoc2;
                    });

                    widget.onTap(result);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      _directLoc2?.name ?? _s!.searchingRuleDetailedAreaSelection,
                      style: TextStyle(
                        color: AppColor.color1010,
                        fontSize: 16.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 16.r,
                      height: 16.r,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/icon/arrow_drop_down2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}