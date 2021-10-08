import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;

class LogInButton extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
  final ImageProvider icon;
  final String text;

  final VoidCallback? onTap;

  const LogInButton(
      {Key? key,
        required this.onTap,
        required this.text,
        required this.icon,
        this.width = 38,
        this.height = 30,
        this.iconSize = 24,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          InkWell(
            onTap: () => onTap?.call(),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColor.color1009, width: 1.r, ),
                color: AppColor.color101,
              ),
              padding: EdgeInsets.only(left: 18.w, right: 25.w, ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Container(
                    width: iconSize,
                    height: iconSize,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: icon,
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        style: TextStyle(
                          color: AppColor.color1010,
                          fontSize: 14.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
