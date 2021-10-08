import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/pages/home.dart';

part 'review_reg.ext.dart';

enum ReviewRegType{
  reviewReg,
  reviewModify,
  replyReg,
  replyModify,
}

class FSReviewRegPage extends StatefulWidget {
  final Store store;
  final Review? review;

  FSReviewRegPage({Key? key,
    required this.store,
    this.review,
  }) : super(key: key);

  @override
  FSReviewRegPageState createState() => FSReviewRegPageState();
}

class FSReviewRegPageState extends State<FSReviewRegPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  late Store _store;
  Review? _review;

  S? _s;                     //application localization

  late ReviewRegType _reviewRegType;

  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();
  int? _selectedRating;

  @override
  void initState() {
    super.initState();
    _store = widget.store;
    _review = widget.review;

    // get the ReviewRegType
    if(_review == null) _reviewRegType = ReviewRegType.reviewReg;
    else if (_review!.replyable! && _review!.children == null) _reviewRegType = ReviewRegType.replyReg;
    else if (_review!.editable!) _reviewRegType = ReviewRegType.reviewModify;
    else _reviewRegType = ReviewRegType.replyModify;

    _reviewController.text = (_review == null) ? '' : _review!.review;
    _replyController.text = (_review?.children == null) ? '' : _review!.children![0].review;
    _selectedRating = _review?.rating;
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
        child: BlocListener<FSReviewRegBloc, FSReviewRegState>(
          listener: (context, state){
            if(state is FSReviewRegUpdateReviewSuccess) {
              logger.d('${this.runtimeType} FSReviewRegUpdateReviewSuccess');
              // update store info
              Navigator.of(context).pop({'review': state.review});
            }else if(state is FSReviewRegUpdateReviewFailure){
              logger.d('${this.runtimeType} FSReviewRegUpdateReviewFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSReviewRegRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSReviewRegRefreshTokenRequired eventToResend : ${state.eventToResend}');
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