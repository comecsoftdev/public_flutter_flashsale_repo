import 'dart:ui';
import 'package:comecsoft/components/components.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprintf/sprintf.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/generated/l10n.dart';


class ProductDetailWidget extends StatefulWidget {
  final Product product;
  // callback function when product is clicked
  final void Function(int, bool)? onSelect;
  // product is selected or not
  // when the image is tapped,
  // if selected == null, The image viewer appear
  // if selected has true or false, Image selection toggles
  final bool? selected;
  // product discount time ex) "12:30"
  final String? discountTime;

  ProductDetailWidget({
    Key? key,
    required this.product,
    this.onSelect,
    this.selected,
    this.discountTime,
  }) : super(key: key);

  @override
  ProductDetailWidgetState createState() => ProductDetailWidgetState();
}

class ProductDetailWidgetState extends State<ProductDetailWidget> {
  late Product _product;
  late bool? _selected;

  S? _s;                     //application localization

  late double _productImageHeight;
  late double _productDescriptionHeight;
  late double _productImageWidth;

  @override
  void initState() {
    super.initState();

    _product = widget.product;
    _selected = widget.selected;

    _productImageHeight = 220.h;
    _productDescriptionHeight = 158.h;
    _productImageWidth = 1.sw;
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.color101,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // [ product Image & discount rate ]
            Container(
              width: _productImageWidth,
              height: _productImageHeight,
              child: Stack(
                children: <Widget>[
                  // [ product Image ]
                  InkWell(
                    onTap: (){
                      if (_selected == null){
                        Map<String, dynamic> arguments = {'imageProvider': getCachedNetworkImageProviderFromS3(widget.product.image!)};
                        Navigator.of(context).pushNamed('fsimageviewer', arguments: arguments);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: getCachedNetworkImageProviderFromS3(_product.image!),
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                  // [ discount rate ]
                  Positioned(
                    left: 22.w,
                    child: ClipRect(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        width: 44.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r), ),
                          color: AppColor.color1011,
                        ),
                        padding: EdgeInsets.only(left: 7.w, right: 6.w, top: 8.h, bottom: 10.h, ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Text(
                                  '${_product.dRate.toString()}%',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.color101,
                                    fontSize: 13.sp,
                                    fontFamily: "SpoqaHanSansNeo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Off',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.color101,
                                    fontSize: 13.sp,
                                    fontFamily: "SpoqaHanSansNeo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // [ post or not post.. toggle button]
                  _getPostToggle(),
                ],
              ),
            ),
            // [ product Description ]
            Container(
              width: _productImageWidth,
              height: _productDescriptionHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h,),
                  // [discount time & original price]
                  Row(
                    children: [
                      (widget.discountTime != null) ? _getDiscountTime() : Container(),
                      Spacer(),
                      Text(
                        "${_product.price}${_s!.commonWon}",
                        style: TextStyle(
                            color: AppColor.color1020,
                            fontSize: 14.sp,
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h,),
                  // [product name & discount price]
                  Row(
                    children: [
                      Container(
                        child: Text(
                          _product.name!,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 18.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Text(
                          "${_product.dPrice}${_s!.commonWon}",
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 16.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  FSDivider(height: 1.h, color: AppColor.color1014),
                  SizedBox(height: 12.h,),
                  // [product comment]
                  Container(
                    child: Text(
                      _s!.commonIntroduce,
                      style: TextStyle(
                        color: AppColor.color1010,
                        fontSize: 14.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    child: Text(
                      _product.comment!,
                      //"가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하",
                      style: TextStyle(
                        color: AppColor.color1010,
                        fontSize: 14.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getDiscountTime(){
    return Row(
      children: [
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
          widget.discountTime!,
          style: TextStyle(
            color: AppColor.color1011,
            fontSize: 13.sp,
            fontFamily: "SpoqaHanSansNeo",
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          " ${_s!.commonUntil}",
          style: TextStyle(
            color: AppColor.color1010,
            fontSize: 12.sp,
            fontFamily: "SpoqaHanSansNeo",
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _getPostToggle(){
    return (_selected != null) ?
    Positioned(
      bottom: 20.h,
      right: 22.w,
      child: ToggleSwitch(
        minHeight: 32.h,
        minWidth: 70.w,
        cornerRadius: 20.r,
        totalSwitches: 2,
        activeFgColor: Colors.white,
        inactiveBgColor: AppColor.color1020,
        inactiveFgColor: Colors.white,
        activeBgColors: [[AppColor.color1019],[AppColor.color1019]],
        initialLabelIndex: (_selected!) ? 0 : 1,
        labels: [_s!.commonPost, _s!.commonNotPost],
        onToggle: (index){
          _selected = (index == 0) ? true : false;
          widget.onSelect?.call(_product.id!, _selected!);
        },
      ),
    ) :
    Container();
  }
}