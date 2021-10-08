import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:comecsoft/common/colors.dart' as AppColor;

class HeaderBarWidget extends StatelessWidget {
  final String title;
  final List<Widget>? trailing;
  final Color backgroundColor;

  const HeaderBarWidget({
    Key? key,
    required this.title,
    this.trailing,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> headerBarWidgets = [];

    headerBarWidgets.add(
      Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(10.r),
            width: 24.r,
            height: 24.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (backgroundColor == Colors.white) ? AssetImage("assets/images/icon/arrow_left_b.png") : AssetImage("assets/images/icon/arrow_left_w.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );

    headerBarWidgets.add(
      Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: (backgroundColor == Colors.white) ? Color(0xff333333) : AppColor.color101,
            fontSize: 16.sp,
            fontFamily: "SpoqaHanSansNeo",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

    if(trailing != null){
      headerBarWidgets.add(
      Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: trailing!.map((i) => i).toList()
        ),
      ));
    }

    return Container(
      color: backgroundColor,
      height: 50.h,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h, ),
              child: Stack(
                  alignment: Alignment.center,
                  children: headerBarWidgets
              ),
            ),
          ),
          Container(
            height: 1,
            color: (backgroundColor == Colors.white) ? Color(0xffebebeb) : backgroundColor,
          )
        ],
      ),
    );
  }
}