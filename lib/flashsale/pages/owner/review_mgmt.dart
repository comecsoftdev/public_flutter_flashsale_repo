import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprintf/sprintf.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/flashsale/pages/report.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/pages/home.dart';

part 'review_mgmt.ext.dart';


class FSReviewMgmtPage extends StatefulWidget {
  final Store? store;

  FSReviewMgmtPage({Key? key,
    required this.store,
  }) :  super(key: key);

  @override
  FSReviewMgmtPageState createState() => FSReviewMgmtPageState();
}

class FSReviewMgmtPageState extends State<FSReviewMgmtPage> with SingleTickerProviderStateMixin{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();
  ReviewInfo? _reviewInfo;
  ReviewInfo? _unansweredReviewInfo;

  late Store _store;

  S? _s;                     //application localization

  late TabController _tabController;
  @override
  void initState() {
    _store = widget.store!;

    // _tabController = new TabController(length: 2, vsync: this);
    // currently supports only review Tab
    _tabController = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    logger.d('${this.runtimeType} didChangeDependencies');

    // send _sendInit() if FSStorePage not initialized
    if (_reviewInfo == null && _unansweredReviewInfo == null) _sendInit();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    logger.d('${this.runtimeType} dispose');
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      key: _scaffoldKey,
      body: SafeArea(
        child: BlocListener<FSReviewMgmtBloc, FSReviewMgmtState>(
          listener: (context, state) {
            if (state is FSReviewMgmtInitDone) {
              logger.d('${this.runtimeType} FSReviewMgmtInitDone');

              // get reviews & unanswered reviews
              _getReviewsAndUnAnsweredReviews(_store.id, 1, constants.defaultMorePageSize, null);
              _progressHUDKey.currentState!.show();
            }else if(state is FSReviewMgmtGetReviewsAndUnAnsweredReviewsSuccess) {
              logger.d('${this.runtimeType} FSReviewMgmtGetReviewsAndUnAnsweredReviewsSuccess');
              _progressHUDKey.currentState!.dismiss();
              if (state.reviewInfo!.page == 1){
                setState(() {
                  _reviewInfo = state.reviewInfo;
                });
              }else{
                setState(() {
                  _reviewInfo!.totalCount = state.reviewInfo!.totalCount;
                  _reviewInfo!.page = state.reviewInfo!.page;
                  _reviewInfo!.pageSize = state.reviewInfo!.pageSize;
                  _reviewInfo!.reviews!.addAll(state.reviewInfo!.reviews!);
                });
              }
            }
            else if(state is FSReviewMgmtGetReviewsAndUnAnsweredReviewsFailure){
              logger.d('${this.runtimeType} FSReviewMgmtGetReviewsAndUnAnsweredReviewsFailure');

              showAlertDialog(context,
                _s!.commonNetworkError,
                sprintf('%s\n%s', [state.comment, _s!.commonConnectAgain]),
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                  _getReviewsAndUnAnsweredReviews(_store.id, 1, constants.defaultMorePageSize, null);
                },
                no: _s!.commonCancel,
                noOnPressed: () => closeApp(),
              );
            }
            else if(state is FSReviewMgmtUnRegisterReviewSuccess) {
              logger.d('${this.runtimeType} FSReviewMgmtUnRegisterReviewSuccess');

              // increase unAnsweredReviewCount
              _store.unAnsweredReviewCount = _store.unAnsweredReviewCount! + 1;

              // remove manager's response
              Review parent = _reviewInfo!.reviews!.firstWhere((element) => element.children?[0].id == state.reviewId);
              setState(() {
                // remove manager's response
                parent.children = null;
              });
            }
            else if(state is FSReviewMgmtUnRegisterReviewFailure){
              logger.d('${this.runtimeType} FSReviewMgmtUnRegisterReviewFailure');

              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            else if(state is FSReviewMgmtActivateStoreReviewSuccess) {
              logger.d('${this.runtimeType} FSReviewMgmtActivateStoreReviewSuccess');

              setState(() {
                _store.enableReview = state.enable;
              });

              showAlertDialog(context,
                (state.enable) ? _s!.reviewMgmtEnableReview : _s!.reviewMgmtDisableReview,
                null,
                yes: _s!.commonOK,
                yesOnPressed: () => Navigator.pop(context),
              );
            }
            else if(state is FSReviewMgmtActivateStoreReviewFailure){
              logger.d('${this.runtimeType} FSReviewMgmtActivateStoreReviewFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            else if(state is FSReviewMgmtRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSReviewMgmtRefreshTokenRequired eventToResend : ${state.eventToResend}');
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
