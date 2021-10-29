import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/components/components.dart';


class StoreRatingWidget extends StatefulWidget {
  // example {'1': 5, '2': 5, '3': 5, '4':5, '5':5}
  final Map<String, int> ratings;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? contentPadding;

  StoreRatingWidget({
    Key? key,
    required this.ratings,
    this.boxDecoration,
    this.contentPadding,
  }) :  super(key: key);

  @override
  StoreRatingWidgetState createState() => StoreRatingWidgetState();
}

class StoreRatingWidgetState extends State<StoreRatingWidget> {
  @override
  Widget build(BuildContext context) {
    int cnt = widget.ratings['1']! + widget.ratings['2']! + widget.ratings['3']! + widget.ratings['4']! + widget.ratings['5']!;
    String avg = (cnt == 0) ? '0' : (((1*widget.ratings['1']!) + (2*widget.ratings['2']!) + (3*widget.ratings['3']!) +
        (4*widget.ratings['4']!) + (5*widget.ratings['5']!)) / cnt).toStringAsFixed(1);

    return Container(
      padding: _getContentPadding(),
      width: 335.w,
      decoration: _getBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                avg.toString(),
                style: TextStyle(
                  color: AppColor.color201,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              RatingBar.builder(
                initialRating: double.parse(avg),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Colors.amber.withAlpha(50),
                itemCount: 5,
                itemSize: 20.r,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                updateOnDrag: false,
                ignoreGestures: true,
                onRatingUpdate: (rating){},
              ),
              Text(
                cnt.toString(),
                style: TextStyle(
                  color: AppColor.color201,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(width: 35.w),
          LinearRatingBarWidget(ratings: widget.ratings),
        ],
      ),
    );
  }

  BoxDecoration _getBoxDecoration(){
    return widget.boxDecoration ?? BoxDecoration(
      borderRadius: BorderRadius.circular(4.r),
      boxShadow: [
        BoxShadow(
          color: AppColor.color1016,
          blurRadius: 12.r,
          offset: Offset(0, 8),
        ),
      ],
      color: AppColor.color101,
    );
  }

  EdgeInsets _getContentPadding(){
    return widget.contentPadding ?? EdgeInsets.only(right: 0.w, left: 0.w, top: 20.h, bottom: 20.h);
  }
}