import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;

class LinearRatingBarWidget extends StatefulWidget {
  // example {'1': 5, '2': 5, '3': 5, '4':5, '5':5}
  final Map<String, int>? ratings;

  LinearRatingBarWidget({
    Key? key,
    required this.ratings,
  }):   super(key: key);

  @override
  _LinearRatingBarWidgetState createState() => _LinearRatingBarWidgetState();
}

class _LinearRatingBarWidgetState extends State<LinearRatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    int r1 = (widget.ratings != null) ? widget.ratings!['1'] ?? 0 : 0;
    int r2 = (widget.ratings != null) ? widget.ratings!['2'] ?? 0 : 0;
    int r3 = (widget.ratings != null) ? widget.ratings!['3'] ?? 0 : 0;
    int r4 = (widget.ratings != null) ? widget.ratings!['4'] ?? 0 : 0;
    int r5 = (widget.ratings != null) ? widget.ratings!['5'] ?? 0 : 0;
    int total = r1 + r2 + r3 + r4 + r5;

    double ratioR1, ratioR2, ratioR3, ratioR4, ratioR5;
    ratioR1 = ((r1 / total).isNaN) ? 0 : (r1 / total);
    ratioR2 = ((r2 / total).isNaN) ? 0 : (r2 / total);
    ratioR3 = ((r3 / total).isNaN) ? 0 : (r3 / total);
    ratioR4 = ((r4 / total).isNaN) ? 0 : (r4 / total);
    ratioR5 = ((r5 / total).isNaN) ? 0 : (r5 / total);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 2.h),
              child: new LinearPercentIndicator(
                leading: Text('5',
                  style: new TextStyle(fontSize: 12.sp),
                ),
                width: 140.w,
                lineHeight: 12.h,
                percent: ratioR5,
                center: Text(
                  "${(ratioR5*100).toStringAsFixed(1)}%($r5)",
                  style: new TextStyle(fontSize: 11.sp),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: AppColor.color1014,
                progressColor: AppColor.color1017,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 2.h),
              child: new LinearPercentIndicator(
                leading: Text('4',
                  style: new TextStyle(fontSize: 12.sp),
                ),
                width: 140.w,
                lineHeight: 12.h,
                percent: ratioR4,
                center: Text(
                    "${(ratioR4*100).toStringAsFixed(1)}%($r4)",
                  style: new TextStyle(fontSize: 11.sp),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: AppColor.color1014,
                progressColor: AppColor.color1017,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 2.h),
              child: new LinearPercentIndicator(
                leading: Text('3',
                  style: new TextStyle(fontSize: 12.sp),
                ),
                width: 140.w,
                lineHeight: 12.h,
                percent: ratioR3,
                center: Text(
                  "${(ratioR3*100).toStringAsFixed(1)}%($r3)",
                  style: new TextStyle(fontSize: 11.sp),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: AppColor.color1014,
                progressColor: AppColor.color1017,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 2.h),
              child: new LinearPercentIndicator(
                leading: Text('2',
                  style: new TextStyle(fontSize: 12.sp),
                ),
                width: 140.w,
                lineHeight: 12.h,
                percent: ratioR2,
                center: Text(
                  "${(ratioR2*100).toStringAsFixed(1)}%($r2)",
                  style: new TextStyle(fontSize: 11.sp),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: AppColor.color1014,
                progressColor: AppColor.color1017,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 2.h),
              child: new LinearPercentIndicator(
                leading: Text('1',
                  style: new TextStyle(fontSize: 12.sp),
                ),
                width: 140.w,
                lineHeight: 12.h,
                percent: ratioR1,
                center: Text(
                  "${(ratioR1*100).toStringAsFixed(1)}%($r1)",
                  style: new TextStyle(fontSize: 11.sp),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: AppColor.color1014,
                progressColor: AppColor.color1017,
              ),
            ),
          ],
        ),
      ),
    );
  }
}