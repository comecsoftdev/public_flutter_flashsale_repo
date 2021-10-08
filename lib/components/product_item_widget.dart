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


class ProductItemWidget extends StatefulWidget {
  final Product product;

  ProductItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  ProductItemWidgetState createState() => ProductItemWidgetState();
}

class ProductItemWidgetState extends State<ProductItemWidget> {
  S? _s;                     //application localization

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Container(
      child: InkWell(
        onTap: (){
          Map<String, dynamic> arguments = {'product': widget.product};
          Navigator.of(context).pushNamed('fsproductdetail', arguments: arguments);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 144.w,
              height: 102.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                image: DecorationImage(
                    image: getCachedNetworkImageProviderFromS3(
                        widget.product.image!),
                    fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 25.w),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // [ product name ]
                    Container(
                      child: Text(
                        widget.product.name!,
                        style: TextStyle(
                          color: AppColor.color1010,
                          fontSize: 15.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.product.dPrice.toString(),
                                style: TextStyle(
                                  color: AppColor.color1010,
                                  fontSize: 18.sp,
                                  fontFamily: "SpoqaHanSansNeo",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                _s!.commonWon,
                                style: TextStyle(
                                  color: AppColor.color1010,
                                  fontSize: 14.sp,
                                  fontFamily: "SpoqaHanSansNeo",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.product.dRate.toString(),
                                style: TextStyle(
                                  color: AppColor.color1011,
                                  fontSize: 18.sp,
                                  fontFamily: "SpoqaHanSansNeo",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                  color: AppColor.color1011,
                                  fontSize: 14.sp,
                                  fontFamily: "SpoqaHanSansNeo",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "${widget.product.price}${_s!.commonWon}",
                      style: TextStyle(
                        color: AppColor.color1020,
                        fontSize: 14.sp,
                        decoration: TextDecoration.lineThrough,
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