import 'package:comecsoft/flashsale/pages/location.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:geolocator/geolocator.dart';
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

part 'store_mgmt.ext.dart';

class FSStoreMgmtPage extends StatefulWidget {
  FSStoreMgmtPage({Key? key,
  }) :  super(key: key);

  @override
  FSStoreMgmtPageState createState() => FSStoreMgmtPageState();
}

class FSStoreMgmtPageState extends State<FSStoreMgmtPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  Store? _store;
  StoreOwner? _storeOwner;
  Posting? _post;
  late Map<String, int> _ratings;
  StoreGiver? _storeGiver;

  S? _s;                     //application localization

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _setStateData();

    return Scaffold(
      backgroundColor: AppColor.color101,
      key: _scaffoldKey,
      body: SafeArea(
        child: BlocListener<FSStoreMgmtBloc, FSStoreMgmtState>(
          listener: (context, state){
            if(state is FSStoreMgmtUnRegisterStoreSuccess) {
              logger.d('${this.runtimeType} FSStoreMgmtUnRegisterStoreSuccess');
              _storeDeleted();
            }
            else if(state is FSStoreMgmtUnRegisterStoreFailure) {
              logger.d('${this.runtimeType} FSStoreMgmtUnRegisterStoreFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            else if(state is FSStoreMgmtGetStoreReportSuccess) {
              logger.d('${this.runtimeType} FSStoreMgmtGetStoreReportSuccess');
              // view store report
              Map<String, dynamic> arguments = {'id': _store!.id, 'title': _store!.placeName,
                'reportType': StoreReportType.viewStoreReport, 'reports': state.storeReport};
              Navigator.of(context).pushNamed('fsreport', arguments: arguments);
            }
            else if(state is FSStoreMgmtUnRegisterStoreFailure) {
              logger.d('${this.runtimeType} FSStoreMgmtUnRegisterStoreFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            else if(state is FSStoreMgmtRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSStoreMgmtRefreshTokenRequired eventToResend : ${state.eventToResend}');
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