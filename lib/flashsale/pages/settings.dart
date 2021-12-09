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

part 'settings.ext.dart';

class FSSettingsPage extends StatefulWidget {
  // AppState.of(context).user
  final User user;

  FSSettingsPage({Key? key,
    required this.user,
  }) : super(key: key);

  @override
  FSSettingsPageState createState() => FSSettingsPageState();
}

class FSSettingsPageState extends State<FSSettingsPage> {
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  S? _s;                     //application localization
  String? _userType;
  StoreGiver? _storeGiver;
  StoreRecipient? _storeRecipient;
  Store? _store;
  bool _updateAddr = false;
  late String _version;

  @override
  Widget build(BuildContext context) {
    _setStateData();

    return Scaffold(
      backgroundColor: AppColor.color101,
      body: SafeArea(
        child: BlocListener<FsSettingsBloc, FSSettingsState>(
          listener: (context, state) async{
            if(state is FSSettingsLogOutSuccess) {
              logger.d('${this.runtimeType} FSSettingsLogOutSuccess');

              // set user related sso shared preferences to null
              signOutCleanup(context);
              // remove all cache data
              DioHelper.getCacheManager()!.clearAll();
              // push all pages and go to login page
              Navigator.of(context).pushNamedAndRemoveUntil(getSSOSigninpage(context)!, (Route<dynamic> route) => false);
            }else if(state is FSSettingsLogOutFailure) {
              logger.d('${this.runtimeType} FSSettingsLogOutFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                sprintf('%s\n%s', [state.comment, _s!.commonTryAgain]),
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                  _sendLogout();
                },
                no: _s!.commonCancel,
                noOnPressed: () => Navigator.pop(context),
              );
            }else if(state is FSSettingsDeleteUserSuccess) {
              logger.d('${this.runtimeType} FSSettingsDeleteUserSuccess');

              // set user related sso shared preferences to null
              signOutCleanup(context);
              // remove all cache data
              DioHelper.getCacheManager()!.clearAll();
              // push all pages and go to login page
              Navigator.of(context).pushNamedAndRemoveUntil(getSSOSigninpage(context)!, (Route<dynamic> route) => false);
            }else if(state is FSSettingsDeleteUserFailure) {
              logger.d('${this.runtimeType} FSSettingsDeleteUserFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSSettingsTransferCancelSuccess) {
              logger.d('${this.runtimeType} FSSettingsTransferCancelSuccess');
              UserInfo userInfo = FSAppState.of(context).userInfo!;
              userInfo.storeGiver = _storeGiver = null;
              FSAppState.of(context).setUserInfo(userInfo);
              setState(() { });
            }else if(state is FSSettingsTransferCancelFailure) {
              logger.d('${this.runtimeType} FSSettingsTransferCancelFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSSettingGetSimpleStoreSuccess) {
              logger.d('${this.runtimeType} FSSettingGetSimpleStoreSuccess');
              _showStoreTransferForRecipient(state.store);
            }else if(state is FSSettingGetSimpleStoreFailure) {
              logger.d('${this.runtimeType} FSSettingGetSimpleStoreFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSSettingGetAddressSuccess) {
              logger.d('${this.runtimeType} FSSettingGetAddressSuccess');
              if (state.addressBook != null) FSAppState.of(context).setAddressBook(state.addressBook);
              setState(() { });
            }else if(state is FSSettingGetAddressFailure) {
              logger.d('${this.runtimeType} FSSettingGetAddressFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSSettingsRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSSettingsRefreshTokenRequired eventToResend : ${state.eventToResend}');
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