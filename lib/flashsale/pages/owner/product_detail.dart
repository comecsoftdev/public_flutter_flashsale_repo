import 'package:comecsoft/flashsale/models/models.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;


class FSProductDetailPage extends StatefulWidget {
  final Product product;

  FSProductDetailPage({Key? key,
    required this.product,
  }) : super(key: key);

  @override
  FSProductDetailPageState createState() => FSProductDetailPageState();
}

class FSProductDetailPageState extends State<FSProductDetailPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();
  S? _s;                     //application localization

  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      key: _scaffoldKey,
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
      title: _s!.productMgmtProdDetail,
    );
  }

  Widget _buildBody(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 32.h,),
          ProductDetailWidget(
            product: widget.product,
          ),
        ],
      ),
    );
  }
}
