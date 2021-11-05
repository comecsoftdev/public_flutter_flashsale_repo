import 'package:comecsoft/accounts/repository/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/components/animation_widget.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/common/colors.dart' as AppColor;


class PostDiscountTimeWidget extends StatefulWidget {
  final int postEndTime;
  final int postStartTime;

  PostDiscountTimeWidget({
    Key? key,
    this.postStartTime = 10,
    this.postEndTime = 21,
  }) : super(key: key);

  @override
  PostDiscountTimeWidgetState createState() => PostDiscountTimeWidgetState();
}

class PostDiscountTimeWidgetState extends State<PostDiscountTimeWidget> {
  GlobalKey<ExpandedSectionState> _expandedSectionKey = GlobalKey<ExpandedSectionState>();

  DateTime? _postingTime;

  bool _showNoSelectionError = false;

  S? _s;                     //application localization

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              FSTitleWithDesc(context, _s!.postRegPostingTime, _s!.postRegPostingTimeDesc, color: AppColor.color1010, fontSize: 18.sp),
              Spacer(),
              // [ time setting ]
              InkWell(
                onTap: () => _checkPostingTime(widget.postStartTime, widget.postEndTime),
                child: Container(
                  alignment: Alignment.center,
                  width: 73.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: AppColor.color1019, width: 1.w, ),
                    color: AppColor.color101,
                  ),
                  child: Text(
                    _s!.postRegTimeSetting,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.color1019,
                      fontSize: 13.sp,
                      fontFamily: "SpoqaHanSansNeo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // [ start time & end time ]
          ExpandedSection(
            key: _expandedSectionKey,
            child: Column(
              children: [
                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    // [ start time ]
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 32.h,
                      child: Text(
                        _s!.commonStart,
                        style: TextStyle(
                          color: AppColor.color1010,
                          fontSize: 15.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      height: 32.h,
                      width: 94.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: AppColor.color1009, width: 1.w, ),
                        color: AppColor.color101,
                      ),
                      child: Text(
                        DateFormat("HH : mm").format(DateTime.now()),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.color1020,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Spacer(),
                    // [ end time ]
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 32.h,
                      child: Text(
                        _s!.commonEnd,
                        style: TextStyle(
                          color: AppColor.color1010,
                          fontSize: 15.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      height: 32.h,
                      width: 94.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: AppColor.color1009, width: 1.w, ),
                        color: AppColor.color101,
                      ),
                      child: Text(
                        DateFormat("HH : mm").format(_postingTime ?? DateTime.now()),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.color1020,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          (_showNoSelectionError) ?
          Container(
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                Text(
                  _s!.postRegChoosePostTime,
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ) :
          Container(),
        ],
      ),
    );
  }

  void _checkPostingTime(sTime, eTime) async{
    int maxPostingTime = constants.MAX_POSTING_TIME;
    DateTime now = DateTime.now();

    DateTime svcStartTime =  DateTime(now.year, now.month, now.day, sTime);
    DateTime svcEndTime =  DateTime(now.year, now.month, now.day, eTime);
    int end = 0;

    // calculate valid posting time with remaining posting time and service end time
    if (now.isAfter(svcStartTime) && now.isBefore(svcEndTime)){
      for(end = 0; end < maxPostingTime; end += 10){
        if (now.add(Duration(minutes: end)).isAfter(svcEndTime)){
          break;
        }
      }
    }

    if (end < 20){
      showAlertDialog(context,
        _s!.homeServiceTimeWarning(sTime, eTime),
        null,
        yes: _s!.commonOK,
        yesOnPressed: () => Navigator.pop(context),
      );
    }else{
      Picker(
          adapter: NumberPickerAdapter(data: [
            NumberPickerColumn(begin: 20, end: end, jump: 10, suffix: Text(_s!.commonMin)),
          ]),
          delimiter: [
            PickerDelimiter(child: Container(
              width: 30.0,
              alignment: Alignment.center,
              child: Icon(Icons.more_vert),
            ))
          ],
          itemExtent: 50,
          hideHeader: true,
          title: Text(_s!.postRegChoosePostTime),
          selectedTextStyle: TextStyle(color: Colors.blue),
          cancelText: _s!.commonCancel,
          confirmText: _s!.commonOK,
          onConfirm: (Picker picker, List value) {
            setState(() {
              _postingTime = roundWithin10Minutes(DateTime.now().add(Duration(minutes: picker.getSelectedValues()[0])));
              _expandedSectionKey.currentState!.runExpand(true);
            });
          }
      ).showDialog(context);
    }
  }

  DateTime? getPostingTime(){
    setState(() {
      _showNoSelectionError = (_postingTime == null) ? true : false;
    });

    return _postingTime;
  }
}