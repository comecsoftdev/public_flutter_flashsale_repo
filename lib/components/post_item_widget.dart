import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprintf/sprintf.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/generated/l10n.dart';


class PostItemWidget extends StatefulWidget {
  final Posting posting;
  final void Function(Posting posting)? onTap;

  PostItemWidget({
    Key? key,
    required this.posting,
    this.onTap,
  }) : super(key: key);

  @override
  PostItemWidgetState createState() => PostItemWidgetState();
}

class PostItemWidgetState extends State<PostItemWidget> {
  int _postItemUIType = 1;

  S? _s;                     //application localization

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    if (_postItemUIType == 1){
      return InkWell(
        onTap: () => widget.onTap?.call(widget.posting),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              // [ product image ]
              Container(
                width: 110.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                    image: getCachedNetworkImageProviderFromS3(widget.posting.productImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              // [ product details ]
              Expanded(
                child: Container(
                  height: 96.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      // [ store name, rating, distance, discount time ]
                      Text(
                        widget.posting.name!,
                        style: TextStyle(
                          color: AppColor.color1010,
                          fontSize: 17.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        //width: 150.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                              width: 16.r,
                              height: 16.r,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/icon/clock.png"),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w,),
                            Text(
                              _getValidTime(widget.posting.validity!),
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 13.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 16.r,
                              height: 16.r,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/icon/distance_g.png"),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              distanceConversion(widget.posting.distanceFromMe!.toInt()),
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 13.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      // [ discount rate & product count ]
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Text(
                              "~${widget.posting.productDRate} %",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xffff6666),
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 16.r,
                              height: 16.r,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/icon/present.png"),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              widget.posting.productCount.toString(),
                              style: TextStyle(
                                color: Color(0xff666666),
                                fontSize: 12.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else{
      return InkWell(
        onTap: () => widget.onTap?.call(widget.posting),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              // [ product image ]
              Container(
                width: 110.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                    image: getCachedNetworkImageProviderFromS3(widget.posting.productImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              // [ product details ]
              Expanded(
                child: Container(
                  height: 96.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      // [ store name, rating, distance, discount time ]
                      Text(
                        widget.posting.name!,
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: 150.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                              width: 16.r,
                              height: 16.r,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/icon/clock.png"),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w,),
                            Text(
                              _getValidTime(widget.posting.validity!),
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 13.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                              width: 16.r,
                              height: 16.r,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/icon/star.png"),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(width: 7.w),
                            Text(
                              '${widget.posting.ratingAvg}',
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 13.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              "|",
                              style: TextStyle(
                                color: Color(0xffdddddd),
                                fontSize: 12.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              '${_s!.commonReview} ${widget.posting.ratingCnt}',
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 13.sp,
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
                                    image: AssetImage(
                                        "assets/images/icon/distance_g.png"),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              distanceConversion(widget.posting.distanceFromMe!.toInt()),
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 13.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // [ discount rate & product count ]
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Text(
                              "~${widget.posting.productDRate} %",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xffff6666),
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 16.r,
                              height: 16.r,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/icon/present.png"),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              widget.posting.productCount.toString(),
                              style: TextStyle(
                                color: Color(0xff666666),
                                fontSize: 12.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
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

  String _getValidTime(String validityTime){
    return DateFormat(_s!.postListUntilTime).format(DateTime.parse(validityTime));
  }
}