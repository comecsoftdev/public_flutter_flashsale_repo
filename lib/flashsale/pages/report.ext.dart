part of 'report.dart';

/*
To improve readability, Use extension
 */
extension FSReportPageUIFunctions on FSReportPageState {
  Widget _buildPage() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (_storeReportType == StoreReportType.regStoreReport) {
      return _buildRegStoreReportHeader();
    }else if (_storeReportType == StoreReportType.viewStoreReport) {
      return _buildViewStoreReportHeader();
    }else return Container();
  }

  Widget _buildBody() {
    if (_storeReportType == StoreReportType.regStoreReport) {
      return _buildRegStoreReportBody();
    }else if (_storeReportType == StoreReportType.viewStoreReport) {
      return _buildViewStoreReportBody();
    }else return Container();
  }

  Widget _buildRegStoreReportHeader() {
    return HeaderBarWidget(
      title: _s!.commonStoreReport,
    );
  }

  Widget _buildRegStoreReportBody() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h,),
          // [ title - choose reason ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              _s!.reportChooseReason,
              style: TextStyle(
                color: AppColor.color1010,
                fontSize: 16.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 8.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              _s!.reportSelectOneReason,
              style: TextStyle(
                color: AppColor.color1012,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(height: 24.h,),
          FSDivider(),
          SizedBox(height: 24.h,),
          // [ select reason of reporting ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: _storeReportContents.length,
              itemBuilder: (context, index) {
                String key = _storeReportContents.keys.elementAt(index);

                return ListTile(
                  title: Text(
                    "${_storeReportContents[key]}",
                    style: TextStyle(
                      color: AppColor.color1010,
                      fontSize: 15.sp,
                      fontFamily: "SpoqaHanSansNeo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: _storeReportContents[key] != _s!.reportInappropriateBusinessRegId ? null : Text(
                    _s!.reportInappropriateBusinessRegIdSub,
                    style: TextStyle(
                      color: AppColor.color1010,
                      fontSize: 12.sp,
                      fontFamily: "SpoqaHanSansNeo",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                  onTap: () => itemSelected(key, _title, _storeReportContents[key]),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildViewStoreReportHeader() {
    return HeaderBarWidget(
      title: _s!.reportReportDetail,
      backgroundColor: AppColor.color1019,
    );
  }

  Widget _buildViewStoreReportBody() {
    Map counter = {};
    Map ratio = {};
    int total = 0;

    _storeReportContents.forEach((key, value) =>  counter[key] = _reports!.where((e) => e.report == int.parse(key)).length);
    counter.forEach((key, value) => total += value as int);
    counter.forEach((key, value) => ratio[key] = ((value / total).isNaN) ? 0 : (value / total));

    List<Widget> linearReportBar = [];
    _storeReportContents.forEach((key, value) {
      linearReportBar.add(
        // [ Store report content & percentage ]
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                _storeReportContents[key],
                style: TextStyle(
                  color: AppColor.color1010,
                  fontSize: 14.sp,
                  fontFamily: "SpoqaHanSansNeo",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "${(ratio[key]*100).toStringAsFixed(1)}%",
                    style: TextStyle(
                      color: AppColor.color1011,
                      fontSize: 14.sp,
                      fontFamily: "SpoqaHanSansNeo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "(${counter[key]}/$total)",
                    style: TextStyle(
                      color: AppColor.color1020,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          )
        )
      );
      linearReportBar.add(SizedBox(height: 5.h,));
      // [ LinearPercentIndicator ]
      linearReportBar.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            lineHeight: 16.h,
            percent: ratio[key].toDouble(),
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: AppColor.color1014,
            progressColor: AppColor.color1011,
          ),
        ),
      );
      linearReportBar.add(SizedBox(height: 16.h));
    });

    return Column(
      children: [
        SizedBox(height: 24.h,),
        // [ description of total report count ]
        Container(
          child: Text(
            _s!.storeReportTotalReport(total),
            style: TextStyle(
              color: AppColor.color1012,
              fontSize: 15.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 24.h,),
        // [ linear percentage indicator ]
        for(Widget widget in linearReportBar)
          widget,
        SizedBox(height: 20.h,),
        FSDivider(height: 4.h, color: AppColor.color1016),
        SizedBox(height: 24.h,),
        // [ details ]
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            _s!.commonDetails,
            style: TextStyle(
              color: AppColor.color1010,
              fontSize: 16.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 12.h,),
        // [ list of store reports ]
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: _reports!.length,
          itemBuilder: (context, index) {
            final item = _reports![index];

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 1,
                    color: AppColor.color1016,
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    _storeReportContents[item.report.toString()],
                    style: TextStyle(
                      color: AppColor.color1010,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 4.h,),
                  Text(
                    getTimeFormatType3(_s!, item.created),
                    style: TextStyle(
                      color: AppColor.color1020,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 15.h,),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 12.h,),
      ],
    );
  }
}

extension FSReportPagePrivatePublicFunctions on FSReportPageState {
  void itemSelected(key, store, reason){
    showAlertDialog(context,
      _s!.commonStoreReport,
      '$store\n$reason\n${_s!.reportLikeToReport}',
      yes: _s!.commonOK,
      yesOnPressed: () {
        Navigator.pop(context);
        _regStoreReport(_storeId, int.parse(key));
      },
      no: _s!.commonCancel,
      noOnPressed: () => Navigator.pop(context),
    );
  }
}

extension FSReportPageEventFunctions on FSReportPageState {
  /*
  define event-related functions in settings page below.
  and add FSReportEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSReportRegStoreReport) _regStoreReport(event.storeId, event.report);
  }

  void _regStoreReport(storeId, report) => BlocProvider.of<FSReportBloc>(context).add(FSReportRegStoreReport(
      token: getSSOToken(context)!, storeId: storeId, report: report));
}