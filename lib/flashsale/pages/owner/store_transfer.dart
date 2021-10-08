import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as flutter_foundation;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/flashsale/pages/report.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/pages/home.dart';
import 'package:comecsoft/flashsale/pages/pages.dart';

part 'store_transfer.ext.dart';

enum StoreTransferType{
  transfer,
  take,
}

class FSStoreTransferPage extends StatefulWidget {
  final StoreTransferType storeTransferType;
  final Store store;
  // If you have been given store administrator privileges,
  // recipient is Not null, and recipient.id is transfer ID
  // If you want to transfer the store manager privileges as a store manager,
  // recipient is null
  final StoreRecipient? recipient;

  FSStoreTransferPage({Key? key,
    required this.storeTransferType,
    required this.store,
    this.recipient,
  }) : super(key: key);

  @override
  FSStoreTransferPageState createState() => FSStoreTransferPageState();
}

class FSStoreTransferPageState extends State<FSStoreTransferPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  // Recipient Email
  final GlobalKey<FormFieldState> _emailKey = new GlobalKey();

  // store info for recipient
  GlobalKey<StoreOwnerInfoWidgetState> _storeOwnerKey = new GlobalKey();
  GlobalKey<StoreInfoInputInputWidgetState> _storeInfoKey = new GlobalKey();

  final _emailController = TextEditingController();

  late StoreTransferType _type;
  late StoreRecipient? _recipient;
  late Store _store;

  S? _s;                     //application localization

  @override
  void initState() {
    _type = widget.storeTransferType;
    _recipient = widget.recipient;
    _store = widget.store;

    _emailController.text = env['TEST_EMAIL_ADDRESS'] ?? '';

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      key: _scaffoldKey,
      body: SafeArea(
        child: BlocListener<FSStoreTransferBloc, FSStoreTransferState>(
          listener: (context, state){
            if(state is FSStoreTransferTransferStoreSuccess) {
              logger.d('${this.runtimeType} FSStoreTransferTransferStoreSuccess');

              Navigator.pop(context, state.storeGiver);
            }else if(state is FSStoreTransferTransferStoreFailure) {
              logger.d('${this.runtimeType} FSStoreTransferTransferStoreFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if (state is FSStoreTransferAcceptSuccess){
              logger.d('${this.runtimeType} FSStoreTransferAcceptSuccess');
              Navigator.of(context).pop(state.userInfo);
            }else if (state is FSStoreTransferAcceptFailure){
              logger.d('${this.runtimeType} FSStoreTransferAcceptFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSStoreTransferTransferRejectSuccess) {
              logger.d('${this.runtimeType} FSStoreTransferTransferRejectSuccess');
              Navigator.pop(context, state.transferId);
            }else if(state is FSStoreTransferTransferRejectFailure) {
              logger.d('${this.runtimeType} FSStoreTransferTransferRejectFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSStoreTransferRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSStoreTransferRefreshTokenRequired eventToResend : ${state.eventToResend}');
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
              behavior: HitTestBehavior.opaque,
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