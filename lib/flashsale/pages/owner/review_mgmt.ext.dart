part of 'review_mgmt.dart';
/*
To improve readability, Use extension
 */

extension FSReviewMgmtPageUIFunctions on FSReviewMgmtPageState {
  Widget _buildPage() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeader(),
          // [ disable or enable reviews ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 56.h,
            color: AppColor.color101,
            child: Row(
              children: [
                FSTitleWithDesc(context, _s!.reviewMgmtEnableReviewRating, _s!.reviewMgmtEnableReviewRatingDesc, color: AppColor.color1010, fontSize: 15.sp),
                Spacer(),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: _store.enableReview!,
                    onChanged: (value) {
                      _activateStoreReview(_store.id, value);
                    },
                  ),
                ),
              ],
            ),
          ),
          // [ tab bar for reviews and unanswered reviews ]
          TabBar(
            labelColor: AppColor.color1010,
            labelStyle:TextStyle(
              color: AppColor.color1010,
              fontSize: 15.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelColor: AppColor.color1010,
            unselectedLabelStyle: TextStyle(
              color: AppColor.color1010,
              fontSize: 15.sp,
            ),
            tabs: [
              SizedBox(
                //height: 56.h,
                child: Tab(
                  text: (_reviewInfo != null) ? _s!.reviewMgmtTotalReview(_reviewInfo!.totalCount) : _s!.reviewMgmtTotalReview('  '),
                ),
              ),
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                (_reviewInfo != null) ? _buildBodyReview() : Container(),
                // currently not support unanswered review
                // (_unansweredReviewInfo != null) ? _buildBodyUnAnsweredReview() : Container(),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return HeaderBarWidget(
      title: _s!.reviewMgmtReviewMgmt,
      backgroundColor: AppColor.color1019,
    );
  }

  Widget _buildBodyReview() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildReview(),
            _buildMoreReview(),
          ],
        ),
      ),
    );
  }

  Widget _buildReview() {
    // add reportable in _reviewInfo.reviews
    _reviewInfo?.reviews?.forEach((element) {
      if (element.children != null) element.children!.forEach((element) => element.editable = true);
      else element.replyable = true;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
          child: ReviewListWidget(
            reviews: _reviewInfo!.reviews,
            onEvent: _reviewMenuClicked,
          ),
        ),
      ],
    );
  }

  Widget _buildMoreReview(){
    return (_reviewInfo!.totalCount > _reviewInfo!.reviews!.length) ?
    Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.w),
      child: FSButton(
        width: 100.w,
        height: 40.h,
        borderRadius: 4.r,
        borderColor: AppColor.color101,
        buttonColor: AppColor.color101,
        text: _s!.storeMoreReview,
        textColor: AppColor.color1019,
        fontSize: 15.sp,
        onTap: (){
          // 10 reviews displayed by default
          // if user tap 'more review', 20, 40, 60, 80 ... reviews displayed.
          // Use base time for performance
          if(_reviewInfo!.page == 1 && _reviewInfo!.pageSize == constants.defaultPageSize)
            _getReviewsAndUnAnsweredReviews(_store.id, 1, constants.defaultMorePageSize, _reviewInfo!.base);
          else
            _getReviewsAndUnAnsweredReviews(_store.id, _reviewInfo!.page + 1, constants.defaultMorePageSize, _reviewInfo!.base);
        },
      ),
    ) :
    Container();
  }
}

extension FSReviewMgmtPagePrivatePublicFunctions on FSReviewMgmtPageState {
  void _reviewMenuClicked(Review review, ReviewSubMenu reviewSubMenu) {
    if (reviewSubMenu == ReviewSubMenu.reply){
      Map<String, dynamic> arguments = {'store': _store, 'review': review};
      Navigator.of(context).pushNamed('fsreviewreg', arguments: arguments).then((value){
        if(value != null && value is Map<String, dynamic>){
          if (value['review'] != null && value['review'].parent != null){
            // decrease unAnsweredReviewCount
            if (_store.unAnsweredReviewCount != null && _store.unAnsweredReviewCount! > 0){
              _store.unAnsweredReviewCount = _store.unAnsweredReviewCount! - 1;
            }

            // add manager's response
            Review? parent = _reviewInfo?.reviews?.firstWhere((element) => element.id == value['review'].parent);
            setState(() {
              parent!.children = []..add(value['review']);
            });
          }
        }
      });
    }else if(reviewSubMenu == ReviewSubMenu.modify){
      // reply modification. get parent review and pass parent review
      Review parent = _reviewInfo!.reviews!.firstWhere((element) => element.children?[0].id == review.id);
      Map<String, dynamic> arguments = {'store': _store, 'review': parent};
      Navigator.of(context).pushNamed('fsreviewreg', arguments: arguments).then((value){
        if(value != null && value is Map<String, dynamic>){
          if (value['review'] != null && value['review'].parent != null){
            Review? parent = _reviewInfo?.reviews?.firstWhere((element) => element.id == value['review'].parent);
            setState(() {
              parent!.children![0] = value['review'];
            });
          }
        }
      });
    }else if(reviewSubMenu == ReviewSubMenu.delete){
      _unRegisterReview(_store.id, review.id);
    }
  }
}

extension FSReviewMgmtPageEventFunctions on FSReviewMgmtPageState {
  /*
  define event-related functions in post page below.
  and add FsPostEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSReviewMgmtUnRegisterReview) _unRegisterReview(event.storeId, event.reviewId,);
    if(event is FSReviewMgmtGetReviewsAndUnAnsweredReviews) _getReviewsAndUnAnsweredReviews(event.storeId, event.page, event.pageSize, event.base);
    if(event is FSReviewMgmtActivateStoreReview) _activateStoreReview(event.storeId, event.enable);
  }

  void _sendInit() => BlocProvider.of<FSReviewMgmtBloc>(context).add(FSReviewMgmtInit());

  void _unRegisterReview(storeId, reviewId) => BlocProvider.of<FSReviewMgmtBloc>(context).add(FSReviewMgmtUnRegisterReview(
    token: getSSOToken(context)!, storeId: storeId, reviewId: reviewId,)
  );

  void _activateStoreReview(storeId, enable) => BlocProvider.of<FSReviewMgmtBloc>(context).add(FSReviewMgmtActivateStoreReview(
    token: getSSOToken(context)!, storeId: storeId, enable: enable,)
  );

  void _getReviewsAndUnAnsweredReviews(storeId, page, pageSize, base) => BlocProvider.of<FSReviewMgmtBloc>(context).add(FSReviewMgmtGetReviewsAndUnAnsweredReviews(
      token: getSSOToken(context)!, storeId: storeId, page: page, pageSize: pageSize, base: base)
  );
}