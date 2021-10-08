import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprintf/sprintf.dart';
import 'package:share/share.dart';

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

part 'store.ext.dart';

class FSStorePage extends StatefulWidget {
  final Posting post;
  // true if it is possible to stop posting because it is my shop
  final bool stopPosting;

  FSStorePage({Key? key,
    required this.post,
    this.stopPosting = false,
  }) :  super(key: key);

  @override
  FSStorePageState createState() => FSStorePageState();
}

class FSStorePageState extends State<FSStorePage>{
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();
  GlobalKey<MapWidgetState> _storeMapScreenKey = new GlobalKey();

  GlobalKey<MapWidgetState> get storeMapScreenKey => _storeMapScreenKey;

  Posting? _post;
  Store? _store;
  ReviewInfo? _reviewInfo;
  late Map<String, int> _ratings;
  Review? _myReview;

  S? _s;                     //application localization

  @override
  void initState() {
    _post = widget.post;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    logger.d('${this.runtimeType} didChangeDependencies');

    // send _sendInit() if FSStorePage not initialized
    if (_store == null) _sendInit();

    super.didChangeDependencies();
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
      floatingActionButton: (widget.stopPosting) ?
      Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Container(
          width: 130.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.r),
            color: AppColor.color1019,
          ),
          child: FloatingActionButton.extended(
            onPressed: () => _stopPostingTapped(),
            icon: Icon(Icons.stop),
            label: Text(_s!.homeDrawerStopPost),
            backgroundColor: AppColor.color1019,
          ),
        ),
      ) :
      Container(),
      body: SafeArea(
        child: BlocListener<FSStoreBloc, FSStoreState>(
          listener: (context, state) async{
            if (state is FSStoreInitDone) {
              logger.d('${this.runtimeType} FSStoreInitDone');

              // get posted store info
              _getPostedStore(_post!.store);
              _progressHUDKey.currentState!.show();
            }
            else if(state is FSStoreGetPostedStoreSuccess) {
              logger.d('${this.runtimeType} FSStoreGetPostedStoreSuccess');

              _progressHUDKey.currentState!.dismiss();

              setState(() {
                _store = state.store;
                _reviewInfo = state.reviewInfo;
                _myReview = state.myReview;
                _ratings = (_store!.ratings == null) ? {'1': 0, '2': 0, '3': 0, '4': 0, '5': 0} : _store!.ratings!.ratingsToSimpleMap();
              });
            }
            else if(state is FSStoreGetPostedStoreFailure) {
              logger.d('${this.runtimeType} FSStoreGetPostedStoreFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                sprintf('%s\n%s', [state.comment, _s!.commonConnectAgain]),
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                  // get posted store info again
                  _getPostedStore(_post!.store);
                },
              );
            }
            else if(state is FSStoreUnRegisterReviewSuccess) {
              logger.d('${this.runtimeType} FSStoreUnRegisterReviewSuccess');
              setState(() {
                // remove _myReview in _reviewInfo
                _reviewInfo!.reviews!.removeWhere((element) => element.id == _myReview!.id);
                _reviewInfo!.totalCount -= 1;
                // remove my rating and update _ratings
                _ratings[_myReview!.rating.toString()] = _ratings[_myReview!.rating.toString()]! - 1;
                // remove _myReview
                _myReview = null;
              });
            }
            else if(state is FSStoreUnRegisterReviewFailure){
              logger.d('${this.runtimeType} FSStoreUnRegisterReviewFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            else if(state is FSStoreRegisterReviewReportSuccess) {
              logger.d('${this.runtimeType} FSStoreRegisterReviewReportSuccess');
              showAlertDialog(context,
                _s!.commonReportCompleted,
                null,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            else if(state is FSStoreRegisterReviewReportFailure){
              logger.d('${this.runtimeType} FSStoreUnRegisterCommentFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            else if(state is FSStoreGetReviewsSuccess) {
              logger.d('${this.runtimeType} FSStoreGetCommentsSuccess');
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
            else if(state is FSStoreGetReviewsFailure){
              logger.d('${this.runtimeType} FSStoreGetCommentsFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            // For managers of posted store
            else if(state is FSStoreUnRegisterPostSuccess) {
              logger.d('${this.runtimeType} FSStoreUnRegisterPostSuccess');
              Navigator.pop(context, state.extraUserInfo);
            }
            else if(state is FSStoreUnRegisterPostFailure) {
              logger.d('${this.runtimeType} FSStoretUnRegisterPostFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
            else if(state is FSStoreRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSStoreRefreshTokenRequired eventToResend : ${state.eventToResend}');
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