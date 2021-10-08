import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/flashsale/pages/report.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/pages/home.dart';

part 'product_mgmt.ext.dart';

class FSProductMgmtPage extends StatefulWidget {
  final Store store;

  FSProductMgmtPage({Key? key,
    required this.store,
  }) :  super(key: key);

  @override
  FSProductMgmtPageState createState() => FSProductMgmtPageState();
}

class FSProductMgmtPageState extends State<FSProductMgmtPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  late Store _store;

  S? _s;                     //application localization

  @override
  void initState() {
    super.initState();
    _store = widget.store;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      key: _scaffoldKey,
      body: SafeArea(
        child: BlocListener<FSProductMgmtBloc, FSProductMgmtState>(
          listener: (context, state) async{
            if(state is FSProductMgmtUnRegisterProductSuccess) {
              logger.d('${this.runtimeType} FSProductMgmtUnRegisterProductSuccess');
              _productDeleted(state.productId);
              setState(() {
              });
            }else if(state is FSProductMgmtUnRegisterProductFailure) {
              logger.d('${this.runtimeType} FSProductMgmtUnRegisterProductFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSProductMgmtRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSProductMgmtRefreshTokenRequired eventToResend : ${state.eventToResend}');
              // send session related event to FsHomeBloc
              fsHomePageKey.currentState!.sendRefreshToken(state.eventToResend);
            }
          },
          child: ProgressHUD(
            key: _progressHUDKey,
            backgroundColor: AppColor.color90,
            borderColor: AppColor.color90,
            textStyle: TextStyle(color: AppColor.color101, fontSize: 14.0),
            indicatorColor: AppColor.color502,
            child: _buildPage(),
          ),
        ),
      ),
    );
  }
}
