part of 'review_reg.dart';

/*
To improve readability, Use extension
 */

extension FSReviewRegPageUIFunctions on FSReviewRegPageState {
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
    String title;
    switch (_reviewRegType){
      case ReviewRegType.reviewReg:
        title = _s!.commonWriteReview;
        break;

      case ReviewRegType.reviewModify:
        title = _s!.commonEditReview;
        break;

      case ReviewRegType.replyReg:
        title = _s!.commonWriteReply2;
        break;

      default:
        title = _s!.commonEditReply;
    }

    return HeaderBarWidget(
      title: title,
    );
  }

  Widget _buildBody(){
    if (_reviewRegType == ReviewRegType.reviewReg) return _buildReviewReg();
    else if (_reviewRegType == ReviewRegType.replyReg) return _buildReplyReg();
    else if (_reviewRegType == ReviewRegType.reviewModify) return _buildReviewModify();
    return _buildReplyModify();
  }

  Widget _buildReviewReg() {
    return Container(
      //padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 48.h,),
          // [ store name ]
          Text(
            _store.placeName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.color1010,
              fontSize: 20.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.h,),
          // [ RatingConfirmWidget ]
          RatingConfirmWidget(
            rating: 0,
            onRatingUpdate: (value) => _selectedRating = value.toInt(),
          ),
          SizedBox(height: 24.h,),
          // [ review ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: 335.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColor.color1009, width: 1.w, ),
              color: AppColor.color101,
            ),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _reviewController,
              maxLength: 1000,
              minLines: 15,
              maxLines: 15,
              cursorColor: AppColor.color201,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: _s!.commonReviewHint,
                  hintStyle: TextStyle(
                      color: AppColor.color1020,
                      fontSize: 16.sp
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0)),
              onSubmitted: (value) => {},
            ),
          ),
          SizedBox(height: 62.h,),
          // [ submit button ]
          FSButton(
            width: 335.w,
            height: 52.h,
            borderRadius: 8.r,
            borderColor: AppColor.color1011,
            buttonColor: AppColor.color1011,
            text: _s!.commonWriteCompleted,
            textColor: AppColor.color101,
            fontSize: 16.sp,
            onTap: (){
              // 'Please rate and review'
              if (_reviewController.text == "" || _selectedRating == null){
                showAlertDialog(context,
                  _s!.commonRateAndReview,
                  null,
                  yes: _s!.commonOK,
                  yesOnPressed: () => Navigator.pop(context),
                );
              }
              else{
                _regUpdateReview(_store.id, null, null, _reviewController.text, _selectedRating);
              }
            }
          ),
        ],
      ),
    );
  }

  Widget _buildReviewModify() {
    return Container(
      //padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 48.h,),
          // [ store name ]
          Text(
            _store.placeName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.color1010,
              fontSize: 20.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.h,),
          // [ RatingConfirmWidget ]
          RatingConfirmWidget(
            rating: _selectedRating!.toDouble(),
            onRatingUpdate: (value) => _selectedRating = value.toInt(),
          ),
          SizedBox(height: 24.h,),
          // [ review ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: 335.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColor.color1009, width: 1.w, ),
              color: AppColor.color101,
            ),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _reviewController,
              maxLength: 1000,
              minLines: 15,
              maxLines: 15,
              cursorColor: AppColor.color201,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: _s!.commonReviewHint,
                  hintStyle: TextStyle(
                      color: AppColor.color1020,
                      fontSize: 16.sp
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0)),
              onSubmitted: (value) => {},
            ),
          ),
          SizedBox(height: 62.h,),
          // [ submit button ]
          FSButton(
            width: 335.w,
            height: 52.h,
            borderRadius: 8.r,
            borderColor: AppColor.color1011,
            buttonColor: AppColor.color1011,
            text: _s!.commonWriteCompleted,
            textColor: AppColor.color101,
            fontSize: 16.sp,
            onTap: (){
              // 'Please rate and review'
              if (_reviewController.text == "" || _selectedRating == null){
                showAlertDialog(context,
                  _s!.commonRateAndReview,
                  null,
                  yes: _s!.commonOK,
                  yesOnPressed: () => Navigator.pop(context),
                );
              }
              else{
                _regUpdateReview(_store.id, _review!.id, null, _reviewController.text, _selectedRating);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReplyReg() {
    return Container(
      //padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 24.h,),
          // [ customer's review ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ReviewItemWidget(
              review: _review!,
              isChild: false,
              reviewSubMenus: Set<ReviewSubMenu>(),
              onEvent: null,
            ),
          ),
          SizedBox(height: 16.h,),
          // [ reply ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: 335.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColor.color1009, width: 1.w, ),
              color: AppColor.color101,
            ),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _replyController,
              maxLength: 1000,
              minLines: 15,
              maxLines: 15,
              cursorColor: AppColor.color201,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: _s!.commonWriteReply,
                  hintStyle: TextStyle(
                      color: AppColor.color1020,
                      fontSize: 16.sp
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0)),
            ),
          ),
          SizedBox(height: 62.h,),
          // [ submit button ]
          FSButton(
            width: 335.w,
            height: 52.h,
            borderRadius: 8.r,
            borderColor: AppColor.color1019,
            buttonColor: AppColor.color1019,
            text: _s!.commonWriteCompleted,
            textColor: AppColor.color101,
            fontSize: 16.sp,
            onTap: (){
              if (_replyController.text == ""){
                showAlertDialog(context,
                  _s!.commonWriteReply,
                  null,
                  yes: _s!.commonOK,
                  yesOnPressed: () => Navigator.pop(context),
                );
              }
              else{
                _regUpdateReview(_store.id, null, _review!.id, _replyController.text, null);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReplyModify() {
    return Container(
      //padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 24.h,),
          // [ customer's review ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ReviewItemWidget(
              review: _review!,
              isChild: false,
              reviewSubMenus: Set<ReviewSubMenu>(),
              onEvent: null,
            ),
          ),
          SizedBox(height: 16.h,),
          // [ reply ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: 335.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColor.color1009, width: 1.w, ),
              color: AppColor.color101,
            ),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _replyController,
              maxLength: 1000,
              minLines: 15,
              maxLines: 15,
              cursorColor: AppColor.color201,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: _s!.commonWriteReply,
                  hintStyle: TextStyle(
                      color: AppColor.color1020,
                      fontSize: 16.sp
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0)),
              onSubmitted: (value) => {},
            ),
          ),
          SizedBox(height: 62.h,),
          // [ submit button ]
          FSButton(
            width: 335.w,
            height: 52.h,
            borderRadius: 8.r,
            borderColor: AppColor.color1019,
            buttonColor: AppColor.color1019,
            text: _s!.commonWriteCompleted,
            textColor: AppColor.color101,
            fontSize: 16.sp,
            onTap: (){
              if (_replyController.text == ""){
                showAlertDialog(context,
                  _s!.commonWriteReply,
                  null,
                  yes: _s!.commonOK,
                  yesOnPressed: () => Navigator.pop(context),
                );
              }
              else{
                _regUpdateReview(_store.id, _review!.children![0].id, null, _replyController.text, null);
              }
            },
          ),
        ],
      ),
    );
  }
}

extension FSReviewRegPageEventFunctions on FSReviewRegPageState {
  /*
  define event-related functions in post page below.
  and add FSReviewRgeEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSReviewRegUpdateReview) _regUpdateReview(event.storeId, event.reviewId, event.parent, event.review, event.rating);
  }

  void _regUpdateReview(storeId, reviewId, parent, review, rating) => BlocProvider.of<FSReviewRegBloc>(context).add(FSReviewRegUpdateReview(
      token: getSSOToken(context)!, storeId: storeId, parent: parent, reviewId: reviewId, review: review, rating: rating)
  );
}