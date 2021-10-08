import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/pages/pages.dart';

part 'phone_vrf.ext.dart';

class FSPhoneVrfPage extends StatefulWidget {
  FSPhoneVrfPage({Key? key,
  }) : super(key: key);

  @override
  FSPhoneVrfPageState createState() => FSPhoneVrfPageState();
}

class FSPhoneVrfPageState extends State<FSPhoneVrfPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState> _ownerPhoneKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _ownerVrfCodeKey = GlobalKey<FormFieldState>();

  final _ownerPhoneController = TextEditingController();
  final _ownerVrfCodeController = TextEditingController();

  bool _verifyButtonEnabled = false, _requestButtonEnabled = true;

  Timer? _requestCodeBtnTimer;

  S? _s;                     //application localization

  @override
  void dispose() {
    super.dispose();
    _ownerPhoneController.dispose();
    _ownerVrfCodeController.dispose();
    _requestCodeBtnTimer?.cancel();
  }

  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      //resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: SafeArea(
        child: BlocListener<FSPhoneVrfBloc, FSPhoneVrfState>(
          listener: (context, state) {
            if (state is FSPhoneVrfRequestCertCodeSuccess){
              logger.d('${this.runtimeType} FSStoreRegRequestCertCodeSuccess');
              setState(() {
                _enableVrfBtn(true);
                _enableReqBtn(false);
              });

              //after 15sec _requestButtonEnabled will be enabled.
              _requestCodeBtnTimer = Timer(Duration(seconds: 15), () {
                setState(() {
                  _enableReqBtn(true);
                });
              });

              showAlertSnackBar(context, _s!.storeRegSentSMSVrfCode);
            }else if (state is FSPhoneVrfRequestCertCodeFailure){
              logger.d('${this.runtimeType} FSPhoneVrfRequestCertCodeFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if (state is FSPhoneVrfVerifyCertCodeSuccess){
              logger.d('${this.runtimeType} FSPhoneVrfVerifyCertCodeSuccess');
              setState(() {
                _enableReqBtn(true);
                _enableVrfBtn(false);
              });
              Navigator.of(context).pop(state.phone);
            }else if (state is FSPhoneVrfVerifyCertCodeFailure){
              logger.d('${this.runtimeType} FSPhoneVrfVerifyCertCodeFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSPhoneVrfRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSPhoneVrfRefreshTokenRequired eventToResend : ${state.eventToResend}');
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
