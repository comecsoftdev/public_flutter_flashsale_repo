import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:settings_ui/settings_ui.dart';
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

part 'store_reg.ext.dart';

class FSStoreRegPage extends StatefulWidget {
  final StoreOwner? storeOwner;
  final Store? store;

  FSStoreRegPage({
    Key? key,
    required this.storeOwner,
    required this.store,
  }) : super(key: key);

  @override
  FSStoreRegPageState createState() => FSStoreRegPageState();
}

class FSStoreRegPageState extends State<FSStoreRegPage> {
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  GlobalKey<StoreOwnerInfoWidgetState> _storeOwnerKey = new GlobalKey();
  GlobalKey<StoreInfoInputInputWidgetState> _storeInfoKey = new GlobalKey();
  GlobalKey<ImagePickerWidgetState> _imagePickerWidgetKey = new GlobalKey();

  GlobalKey<StoreOwnerInfoWidgetState> get storeOwnerKey => _storeOwnerKey;
  GlobalKey<StoreInfoInputInputWidgetState> get storeInfoKey => _storeInfoKey;

  S? _s;                     //application localization

  StoreOwner? _storeOwner;
  Store? _store;
  bool _update = false;

  ImageProvider? _updateImage;

  @override
  void initState() {
    super.initState();
    _storeOwner = widget.storeOwner;
    _store = widget.store;

    if (_storeOwner != null && _store != null){
      // modify store info
      _update = true;
    }else{
      // register store info
      _storeOwner = StoreOwner.empty();
      _store = Store.empty();
    }

    _updateImage = (_store!.businessReg?.image == null) ? null : getCachedNetworkImageProviderFromS3(_store!.businessReg!.image!);
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
      body: SafeArea(
        child: BlocListener<FSStoreRegBloc, FSStoreRegState>(
          listener: (context, state) async{
            if (state is FSStoreRegUpdateStoreSuccess){
              logger.d('${this.runtimeType} FSStoreRegUpdateStoreSuccess');

              _storeRegUpdated(state.userInfo, state.store, state.storeOwner, state.registration);
            }else if (state is FSStoreRegUpdateStoreFailure){
              logger.d('${this.runtimeType} FSStoreRegisterStoreFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSStoreRegRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSStoreRegRefreshTokenRequired eventToResend : ${state.eventToResend}');
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
            child: GestureDetector(
              //behavior: HitTestBehavior.opaque,
              onTap: (){
                hideSoftKeyboard(context);
              },
              child: _buildPage()
            ),
          ),
        ),
      ),
    );
  }
}