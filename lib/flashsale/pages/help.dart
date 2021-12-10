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


class FSHelpPage extends StatefulWidget {
  FSHelpPage({Key? key,
  }) : super(key: key);

  @override
  FSHelpPageState createState() => FSHelpPageState();
}

class FSHelpPageState extends State<FSHelpPage> {
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  S? _s;                     //application localization

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      body: SafeArea(
        child: ProgressHUD(
          key: _progressHUDKey,
          backgroundColor: AppColor.color90,
          borderColor: AppColor.color90,
          textStyle: TextStyle(color: AppColor.color101, fontSize: 14.0),
          indicatorColor: AppColor.color502,
          child: _buildPage(),
        ),
      ),
    );
  }

  Widget _buildPage() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return HeaderBarWidget(
      title: _s!.homeDrawerHelp,
    );
  }

  Widget _buildBody() {
    logger.d('${this.runtimeType} env_HELP_USER_1_START ${env['HELP_USER_1_START']!}');

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h,),
          ////////////////////////// [ General User ]
          Container(
            child: _buildMainMenu(_s!.helpGeneralUser),
          ),
          // [ Install and Get started  ]
          Container(
            child: _buildSubMenu(
              title: _s!.helpGeneralUserStart,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.helpGeneralUserStart, 'initialHost': env['HELP_USER_1_START']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSDivider(),
          ),
          // [ Find Deals ]
          Container(
            child: _buildSubMenu(
              title: _s!.helpGeneralUserFind,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.helpGeneralUserFind, 'initialHost': env['HELP_USER_2_FIND']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          FSDivider(),
          SizedBox(height: 25.h,),
          ////////////////////////// [ Store Manager ]
          Container(
            child: _buildMainMenu(_s!.helpStoreManager),
          ),
          // [ Store Registration  ]
          Container(
            child: _buildSubMenu(
              title: _s!.helpStoreManagerStore,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.helpStoreManagerStore, 'initialHost': env['HELP_MANAGER_1_STORE']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSDivider(),
          ),
          // [ Product Registration ]
          Container(
            child: _buildSubMenu(
              title: _s!.helpStoreManagerProduct,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.helpStoreManagerProduct, 'initialHost': env['HELP_MANAGER_2_PRODUCT']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSDivider(),
          ),
          // [ Posting Product ]
          Container(
            child: _buildSubMenu(
              title: _s!.helpStoreManagerPost,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.helpStoreManagerPost, 'initialHost': env['HELP_MANAGER_3_POST']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSDivider(),
          ),
          // [ Review Management ]
          Container(
            child: _buildSubMenu(
              title: _s!.helpStoreManagerReview,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.helpStoreManagerReview, 'initialHost': env['HELP_MANAGER_4_REVIEW']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          FSDivider(),
          SizedBox(height: 25.h,),
          ////////////////////////// [ Service ]
          Container(
            child: _buildMainMenu(_s!.helpService),
          ),
          // [ Service Area  ]
          Container(
            child: _buildSubMenu(
              title: _s!.helpServiceServiceArea,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.helpServiceServiceArea, 'initialHost': env['HELP_SERVICE_SERVICE_AREA']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          FSDivider(),
          SizedBox(height: 25.h,),
        ],
      ),
    );
  }

  Widget _buildMainMenu(String title){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.color1012,
          fontSize: 15.sp,
          fontFamily: "SpoqaHanSansNeo",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildSubMenu({required String title, bool enable = true, dynamic onTap}){
    Widget subMenu = Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
      child :Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                color: (enable) ?  AppColor.color1010 : AppColor.color1008,
                fontSize: 17.sp,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: (onTap != null) ? Container(
              width: 16.r,
              height: 16.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon/arrow_right_g.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ) : Container(),
          ),
        ],
      ),
    );

    if (onTap != null && enable){
      return InkWell(
        onTap: () => onTap?.call(),
        child: subMenu,
      );
    }else return subMenu;
  }
}