import 'package:comecsoft/flashsale/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/flashsale/pages/pages.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/components/header_bar_widget.dart';
import 'package:comecsoft/utils/logger.dart';
import 'package:comecsoft/utils/utils.dart';

part 'report.ext.dart';


enum StoreReportType {
  regStoreReport,
  // regReviewReport,
  viewStoreReport,
  //viewReviewReport,
}

/*
  storeReportContents must have same ids as StoreReportContents in backend report.py
  class StoreReportContents(models.IntegerChoices):
    IMAGE = 1, 'Inappropriate product image'
    PRICE = 2, 'Inappropriate price'
    LOCATION = 3, 'Inappropriate store location'
    NAME = 4, 'Inappropriate store name'
    PHONE = 5, 'Inappropriate phone number'
    ADDRESS = 6, 'Inappropriate address'
    ETC = 100, 'Other reasons'
  * */

class FSReportPage extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const FSReportPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  FSReportPageState createState() => FSReportPageState();
}

class FSReportPageState extends State<FSReportPage> {
  // store report type
  late StoreReportType _storeReportType;
  // store id or comment id to report
  late int _storeId;
  // store name or comment to display
  late String _title;
  // Store reports or comments reports to display
  late List<StoreReport>? _reports;

  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  Map _storeReportContents = {};

  S? _s;                     //application localization

  @override
  void initState() {
    _storeReportType = widget.arguments['reportType'];
    _storeId = widget.arguments['id'];
    _title = widget.arguments['title'];
    _reports = widget.arguments['reports'];

    super.initState();
  }

  @override
  void didChangeDependencies() {
    logger.d('${this.runtimeType} didChangeDependencies');
    _s = S.of(context);

    if(_storeReportContents.length == 0){
      _storeReportContents["1"] = _s!.reportInappropriateProductImage;
      _storeReportContents["2"] = _s!.reportInappropriatePrice;
      _storeReportContents["3"] = _s!.reportInappropriateStoreLocation;
      _storeReportContents["4"] = _s!.reportInappropriateStoreName;
      _storeReportContents["5"] = _s!.reportInappropriatePhoneNumber;
      _storeReportContents["6"] = _s!.reportInappropriateAddress;
      _storeReportContents["7"] = _s!.reportInappropriateBusinessRegId;
      _storeReportContents["100"] = _s!.reportETC;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color101,
      body: SafeArea(
        child: BlocListener<FSReportBloc, FSReportState>(
          listener: (context, state) async{
            if(state is FSReportRegStoreReportSuccess) {
              logger.d('${this.runtimeType} FSReportRegStoreReportSuccess');
              showAlertDialog(context,
                _s!.reportBeReported,
                null,
                yes: _s!.commonOK,
                yesOnPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('fsstore'));
                },
                willPopupActive: true,
              );
            }else if(state is FSReportRegStoreReportFailure) {
              logger.d('${this.runtimeType} FSReportRegStoreReportFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSReportRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSReportRefreshTokenRequired eventToResend : ${state.eventToResend}');
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
        )
      ),
    );
  }
}