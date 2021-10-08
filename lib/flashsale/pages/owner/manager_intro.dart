import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/generated/l10n.dart';

class FsManagerIntroPage extends StatelessWidget {
  final GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();
  final SwiperController _swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    List<Widget> introPages = _createIntro(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: ProgressHUD(
            key: _progressHUDKey,
            backgroundColor: AppColor.color90,
            borderColor: AppColor.color90,
            textStyle: TextStyle(color: AppColor.color101, fontSize: 14.0),
            indicatorColor: AppColor.color502,
            child: _buildPage(introPages),
          ),
        ),
      ),
    );//Material App
  }

  Widget _buildPage(introPages){
    return Swiper(
      itemBuilder: (BuildContext context,int index){
        return introPages[index];
      },
      itemCount: introPages.length,
      pagination: SwiperPagination(
        margin: EdgeInsets.only(bottom: 30.h),
        builder: new DotSwiperPaginationBuilder(
          activeColor: AppColor.color1011,
          color: AppColor.color1009,
        ),
      ),
      control: SwiperControl(
          size: 0
      ),
      loop: false,
      controller: _swiperController,
    );
  }

  List<Widget> _createIntro(context){
    S _s = S.of(context);

    return [
      // [ 1st page ]
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 110.h,),
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: AppColor.color201,
                      fontSize: 28.sp,
                      fontFamily: "SpoqaHanSansNeo",
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: _s.introNearbyCustomer,
                        style: TextStyle(
                          color: AppColor.color1019,
                          fontSize: 28.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: _s.introTo),
                    ]
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  _s.introPromote,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color201,
                    fontSize: 28.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
            SizedBox(height: 12.h,),
            Container(
                alignment: Alignment.center,
                child: Text(
                  _s.introNotifyDiscount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 16.sp,
                  ),
                )
            ),
            SizedBox(height: 50.h,),
            Container(
              width: 375.w,
              height: 381.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/manager_intro_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 70.h,),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.w),
              child: InkWell(
                onTap: (){
                  _swiperController.next();
                },
                child: Container(
                  width: 60.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.r),
                    color: AppColor.color1019,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Text(
                        _s.commonNext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // [ 2nd page ]
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 110.h,),
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: AppColor.color201,
                      fontSize: 28.sp,
                      fontFamily: "SpoqaHanSansNeo",
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: _s.introStoreVisit,
                        style: TextStyle(
                          color: AppColor.color1019,
                          fontSize: 28.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: _s.introIs),
                    ]
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  _s.introSales,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color201,
                    fontSize: 28.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
            SizedBox(height: 12.h,),
            Container(
                alignment: Alignment.center,
                child: Text(
                  _s.introEncourageCustomers,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 16.sp,
                  ),
                )
            ),
            SizedBox(height: 50.h,),
            Container(
              width: 375.w,
              height: 381.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/manager_intro_2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 70.h,),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.w),
              child: InkWell(
                onTap: (){
                  _swiperController.next();
                },
                child: Container(
                  width: 60.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.r),
                    color: AppColor.color1019,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Text(
                        _s.commonNext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // [ 3rd page ]
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 110.h,),
            Container(
                alignment: Alignment.center,
                child: Text(
                  _s.introEasyComfortable,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1019,
                    fontSize: 28.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  _s.introUse,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color201,
                    fontSize: 28.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
            SizedBox(height: 12.h,),
            Container(
                alignment: Alignment.center,
                child: Text(
                  _s.introDuringBusiness,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 16.sp,
                  ),
                )
            ),
            SizedBox(height: 50.h,),
            Container(
              width: 375.w,
              height: 381.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/manager_intro_3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 70.h,),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.w),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 60.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.r),
                    color: AppColor.color1019,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Text(
                        _s.commonNext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: "SpoqaHanSansNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ];
  }
}