import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as flutter_foundation;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/accounts/app_state.dart';
import 'package:comecsoft/accounts/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/flashsale/pages/pages.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;


// simple widget like divider, button

Widget FSDivider({height, color}){
  height = height ?? 1.h;
  color = color ?? AppColor.color1016;
  return Container(
    height: height,
    color: color,
  );
}

Widget FSTitleWithDesc(BuildContext context, String title, String desc, {color, fontSize}){
  color = color ?? AppColor.color1012;
  fontSize = fontSize ?? 14.sp;

  return Container(
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontFamily: "SpoqaHanSansNeo",
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 4.w,),
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          constraints: BoxConstraints(),
          icon: Icon(
            Icons.help,
            color: AppColor.color1008,
            size: 20,
          ),
          onPressed: (){
            showAlertDialog(context,
              title,
              desc,
              yes: S.of(context).commonOK,
              yesOnPressed: () => Navigator.pop(context),
              descTextAlign: TextAlign.left,
            );
          },
        ),
      ],
    ),
  );
}

Widget FSIntroText(BuildContext context){
  S _s = S.of(context);

  return Container(
    width: double.infinity,
    child: Column(
      children: [
        SizedBox(height: 90.h,),
        RichText(
          text: TextSpan(
              style: TextStyle(
                color: AppColor.color201,
                fontSize: 22.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w800,
              ),
              children: [
                TextSpan(
                  text: _s.commonSplashAllAroundMe,
                  style: TextStyle(
                    color: AppColor.color201,
                    fontSize: 22.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(text: _s.commonSplashDiscount),
              ]
          ),
        ),
        SizedBox(height: 16.h,),
        RichText(
          text: TextSpan(
              style: TextStyle(
                color: AppColor.color201,
                fontSize: 50.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w800,
              ),
              children: [
                TextSpan(
                  text: _s.commonSplashGage,
                  style: TextStyle(
                    color: AppColor.color1011,
                    fontSize: 50.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(text: _s.commonSplashRo),
              ]
          ),
        ),
      ],
    ),
  );
}

class FSButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final Color buttonColor;
  final String text;
  final Color textColor;
  final double fontSize;
  final VoidCallback? onTap;

  const FSButton(
      {Key? key,
        this.width = 70,
        this.height = 24,
        this.borderRadius = 2,
        this.borderColor = Colors.black,
        this.buttonColor = Colors.white,
        required this.text,
        this.textColor = Colors.black,
        this.fontSize = 15,
        this.onTap,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: 1.w, ),
          color: buttonColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: "SpoqaHanSansNeo",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}