part of 'store.dart';

/*
To improve readability, Use extension
 */
extension FSStorePageUIFunctions on FSStorePageState {
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
    String storeTags = '';

    _post!.tags?.forEach((element) {
      storeTags += '#$element ';
    });

    return Container(
      height: 184.h,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/default_store_view.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x66000000), Color(0x19000000)],)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // [ go previous page ]
          Container(
            height: 50.h,
            color: AppColor.color90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.all(10.r),
                        width: 24.r,
                        height: 24.r,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/icon/arrow_left_w.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          // [ tags ]
          Container(
            height: 24.h,
            color: AppColor.color90,
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                storeTags,
                style: TextStyle(
                  color: AppColor.color101,
                  fontSize: 18.sp,
                  fontFamily: "SpoqaHanSansNeo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h,)
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      //padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15.h,),
          //[store name & rating & distance]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 56.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Tooltip(
                  message: FSAppState.of(context).categoryMap![_store?.category]?.name ?? '',
                  decoration: BoxDecoration(
                    color: AppColor.color404,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  textStyle: TextStyle(color: Colors.white),
                  child: Container(
                    width: 56.r,
                    height: 56.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
//                          image: AssetImage(
//                              "assets/images/icon/default_store.png"),
                          image: (_store != null) ? getCategoryAssetImage(_store!.category) : AssetImage("assets/images/icon/default_store.png"),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  height: 56.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _post!.name!,
                            style: TextStyle(
                              color: AppColor.color1010,
                              fontSize: 16.sp,
                              fontFamily: "SpoqaHanSansNeo",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            width: 250.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 16.r,
                                  height: 16.r,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/icon/star.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                SizedBox(width: 7.w),
                                Text(
                                  // Show star rating if store enable_rev(enable review) is true
                                  (_store?.enableReview ?? false) ? '${_post!.ratingAvg}' : '---',
                                  style: TextStyle(
                                    color: AppColor.color1010,
                                    fontSize: 13.sp,
                                    fontFamily: "SpoqaHanSansNeo",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  "|",
                                  style: TextStyle(
                                    color: AppColor.color1009,
                                    fontSize: 12.sp,
                                    fontFamily: "SpoqaHanSansNeo",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  // Show reviews count if store enable_rev(enable review) is true
                                  (_store?.enableReview ?? false) ? '${_s!.commonReview} ${_post!.ratingCnt}' : '${_s!.commonReview} ---',
                                  style: TextStyle(
                                    color: AppColor.color1010,
                                    fontSize: 13.sp,
                                    fontFamily: "SpoqaHanSansNeo",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Container(
                                  width: 16.r,
                                  height: 16.r,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/icon/distance_g.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  distanceConversion(
                                      _post?.distanceFromMe?.toInt() ?? 0),
                                  style: TextStyle(
                                    color: AppColor.color1010,
                                    fontSize: 13.sp,
                                    fontFamily: "SpoqaHanSansNeo",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          //[call & share & more]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 40.h,
            child: Row(
              children: [
                // [ call ]
                InkWell(
                  onTap: (){
                    goToPhoneApp(_store!.placePhone);
                  },
                  child: Container(
                    width: 121.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColor.color1011,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 35.w, vertical: 8.h,),
                    child: Row(
                      children: [
                        Container(
                          width: 20.r,
                          height: 20.r,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/icon/phone_w.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          _s!.commonPhone,
                          style: TextStyle(
                            color: AppColor.color101,
                            fontSize: 15.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                // [ share ]
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () async{
                    //_shareStore();
                  },
                  child: Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon/share_w.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                // [ more - report a store ]
                GestureDetector(
                  onTapDown: (details) async{

                    List<String> menus = [_s!.commonStoreReport];

                    String selected = await showPopupMenu(context, menus, details.globalPosition);

                    if (selected == _s!.commonStoreReport){
                      // report a store
                      Map<String, dynamic> arguments = {'id': _store!.id, 'title': _store!.placeName, 'reportType': StoreReportType.regStoreReport};
                      Navigator.of(context).pushNamed('fsreport', arguments: arguments);
                    }
                  },
                  child: Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon/more_w.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          FSDivider(height: 1.h,),
          SizedBox(height: 24.h),
          // [product list]
          _buildProductList(),
          SizedBox(height: 20.h),
          // [Store Info]
          (_store != null) ? _buildStoreInfo() : Container(),
          SizedBox(height: 60.h,),
          (_store != null) ? _buildReviewAndRating() : Container(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return Container(
      child: Column(
        children: [
          // [ title - discount product, 5 totals ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _s!.storeDiscountProduct,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 18.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  _s!.commonTotal,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 2),
                Text(
                  _post!.productCount.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1011,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  _s!.commonList1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          (_store == null) ?
          // first display of store page,
          // while getting full store info, just display firs product image
          Container(
            // refer to ProductSwiperWidget
            // width is constants.DefaultFitWidth * 0.85 = 375 * 0.85 = 319
            // height should be _productImageHeight in ProductDetailWidgetState
            width: 319.w,
            height: 220.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              image: DecorationImage(
                  image: getCachedNetworkImageProviderFromS3(
                      _post!.productImage),
                  fit: BoxFit.cover
              ),
            ),
          ) :
          ProductSwiperWidget(
            products: _store!.products,
            discountTime: getTimeFormatType2(_s!, _post!.validity!),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreInfo() {
    return Container(
      child: Column(
        children: [
          // [ title - store info ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _s!.storeStoreInfo,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 18.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          // [ map ]
          _buildMap(_post!.lat, _post!.lng),
          SizedBox(height: 16.h),
          StoreInfoWidget(
            removeTitle: true,
            store: _store!,
            boxDecoration: BoxDecoration(),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  Widget _buildMap(lat, lng) {
    return Center(
      child: InkWell(
        onTap: () {
          Map<String, dynamic> arguments = {
            'latLng': LatLng(double.parse(lat), double.parse(lng)),
            'locationCheckType' : LocationCheckType.checkLocation,
          };
          Navigator.of(context).pushNamed('fslocation', arguments: arguments);
        },
        child: Container(
          width: 335.w,
          height: 224.h,
          child: IgnorePointer(
            child: MapWidget(
              key: _storeMapScreenKey,
              center: LatLng(double.parse(lat), double.parse(lng)),
              zoom: 17,
              mapPurpose: MapPurpose.confirmLocMap,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewAndRating(){
    // Show reviews and star rating if store enable_rev(enable review) is true
    // Show message storeDeactivatedReviewByManager if store enable_rev(enable review) is false
    return (_store!.enableReview ?? false) ?
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // [My Review]
        _buildMyReview(),
        SizedBox(height: 60.h),
        // [Visitor Review]
        _buildVisitorReview(),
        SizedBox(height: 10.h),
        // [more reviews]
        _buildMoreReview(),
      ],
    ) :
    Container(
      width: 1.sw,
      color: AppColor.color1022,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56.r,
            height: 56.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/icon/chat.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          Text(
            _s!.storeDeactivatedReviewByManager,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.color1020,
              fontSize: 16.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildMyReview() {
    // add editable in _myReview
    _myReview?.editable = true;

    return Container(
      child: Column(
        children: [
          // [ title - My Review ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _s!.storeMyReview,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 18.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: (_myReview != null) ?
            // if you have _myReview
            ReviewListWidget(
              reviews: []..add(_myReview),
              onEvent: _reviewMenuClicked,
            ) :
            // If you don't have a review, ask to write a review
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  InkWell(
                    onTap: ()=> _registerMyReviewTapped(),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.w, color: AppColor.color1011),
                        ),
                      ),
                      child: Text(
                        _s!.storeWriteReview,
                        style: TextStyle(
                          color: AppColor.color1010,
                          fontSize: 15.sp,
                          fontFamily: "SpoqaHanSansNeo",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitorReview() {
    return Container(
      child: Column(
        children: [
          // [ title - Visitor Reviews ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _s!.storeVisitorReviews,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 18.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  (_ratings['1']! + _ratings['2']! + _ratings['3']! + _ratings['4']! + _ratings['5']!).toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1011,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  _s!.commonList1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          // [ ratings]
          _buildRatings(_ratings),
          SizedBox(height: 30.h),
          // [ reviews ]
          _buildReview(),
        ],
      ),
    );
  }

  Widget _buildRatings(Map<String, int> ratings) {
    return StoreRatingWidget(
      ratings: ratings,
      //boxDecoration: BoxDecoration(),
    );
  }

  Widget _buildReview() {
    // add reportable in _reviewInfo.reviews
    _reviewInfo?.reviews?.forEach((element) {
      element.reportable = true;
      element.children?[0].reportable = true;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
          child: ReviewListWidget(
            reviews: _reviewInfo?.reviews,
            onEvent: _reviewMenuClicked,
          ),
        ),
      ],
    );
  }

  Widget _buildMoreReview(){
    return (_reviewInfo != null && _reviewInfo!.totalCount > _reviewInfo!.reviews!.length) ?
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
        textColor: AppColor.color1011,
        fontSize: 15.sp,
        onTap: (){
          // 10 reviews displayed by default
          // if user tap 'more review', 20, 40, 60, 80 ... reviews displayed.
          // Use base time for performance
          if(_reviewInfo!.page == 1 && _reviewInfo!.reviews!.length == constants.defaultPageSize) _getReviews(_store!.id, 1, constants.defaultMorePageSize, _reviewInfo!.base);
          else _getReviews(_store!.id, _reviewInfo!.page + 1, constants.defaultMorePageSize, _reviewInfo!.base);
        },
      ),
    ) :
    Container();
  }
}

extension FSStorePagePrivatePublicFunctions on FSStorePageState {
  void _stopPostingTapped(){
    // show post stop popup
    showAlertDialog(context,
      _s!.myStoreStopPosting,
      null,
      yes: _s!.commonOK,
      yesOnPressed: (){
        Navigator.pop(context);
        _unRegisterPost(_store!.id);
      },
      no: _s!.commonCancel,
      noOnPressed: () => Navigator.pop(context),
    );
  }

  void _registerMyReviewTapped(){
    // register review
    Map<String, dynamic> arguments = {'store': _store, 'review': null};
    Navigator.of(context).pushNamed('fsreviewreg', arguments: arguments).then((value){
      if(value != null && value is Map<String, dynamic>){
        if (value['review'] != null){
          setState(() {
            // update myReview
            _myReview = value['review'];
            // add _myReview in _reviewInfo
            _reviewInfo!.reviews!.insert(0, Review.clone(_myReview!));
            _reviewInfo!.totalCount += 1;
            // add my rating and update _ratings
            _ratings[_myReview!.rating.toString()] = _ratings[_myReview!.rating.toString()]! + 1;
          });
        }
      }
    });
  }

  void _shareStore() async {
    //Share.share('https://www.daangn.com/articles/278836333');
    Share.share('https://www.comecsoft.com');
  }
}

extension FSStorePageCBFunctions on FSStorePageState {
  void _reviewMenuClicked(Review review, ReviewSubMenu reviewSubMenu) async{
    if(reviewSubMenu == ReviewSubMenu.modify) {
      // update review
      Map<String, dynamic> arguments = {'store': _store, 'review': _myReview};
      Navigator.of(context).pushNamed('fsreviewreg', arguments: arguments).then((value){
        if(value != null && value is Map<String, dynamic>){
          if (value['review'] != null){
            setState(() {
              // Temporarily save reply of this review
              List<Review>? reply;
              if (_myReview!.children != null) reply = _myReview!.children;
              // remove my old rating
              _ratings[_myReview!.rating.toString()] = _ratings[_myReview!.rating.toString()]! - 1;
              // update myReview
              _myReview = value['review'];
              _myReview!.children = reply;
              // update _myReview in _reviewInfo
              Review myReview = _reviewInfo!.reviews!.firstWhere((element) => element.id == _myReview!.id);
              myReview.review = _myReview!.review;
              myReview.created = _myReview!.created;
              myReview.rating = _myReview!.rating;
              // update my rating
              _ratings[_myReview!.rating.toString()] = _ratings[_myReview!.rating.toString()]! + 1;
            });
          }
        }
      });
    }else if(reviewSubMenu == ReviewSubMenu.delete) {
      // unregister review
      _unRegisterReview(_store!.id, review.id);
    }
    else if(reviewSubMenu == ReviewSubMenu.report) {
      // report a review
      showAlertDialog(context,
        _s!.storeReportReview,
        _s!.storeAskReportReview,
        yes: _s!.commonOK,
        yesOnPressed: (){
          Navigator.pop(context);
          _registerReviewReport(_store!.id, review.id);
        },
        no: _s!.commonCancel,
        noOnPressed: () => Navigator.pop(context),
      );
    }
  }
}

extension FSStorePageEventFunctions on FSStorePageState {
  /*
  define event-related functions in post page below.
  and add FsPostEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSStoreGetPostedStore) _getPostedStore(event.storeId);
    if(event is FSStoreUnRegisterReview) _unRegisterReview(event.storeId, event.reviewId,);
    if(event is FSStoreRegisterReviewReport) _registerReviewReport(event.storeId, event.reviewId,);
    if(event is FSStoreGetReviews) _getReviews(event.storeId, event.page, event.pageSize, event.base);
    if(event is FSStoreUnregisterPost) _unRegisterPost(event.storeId);
  }

  void _sendInit() => BlocProvider.of<FSStoreBloc>(context).add(FSStoreInit());

  void _getPostedStore(storeId) => BlocProvider.of<FSStoreBloc>(context).add(FSStoreGetPostedStore(
      token: getSSOToken(context)!, storeId: storeId)
  );

  void _unRegisterReview(storeId, reviewId) => BlocProvider.of<FSStoreBloc>(context).add(FSStoreUnRegisterReview(
    token: getSSOToken(context)!, storeId: storeId, reviewId: reviewId,)
  );

  void _registerReviewReport(storeId, reviewId) => BlocProvider.of<FSStoreBloc>(context).add(FSStoreRegisterReviewReport(
      token: getSSOToken(context)!, storeId: storeId, reviewId: reviewId)
  );

  void _getReviews(storeId, page, pageSize, base) => BlocProvider.of<FSStoreBloc>(context).add(FSStoreGetReviews(
      token: getSSOToken(context)!, storeId: storeId, page: page, pageSize: pageSize, base: base)
  );

  void _unRegisterPost(storeId) => BlocProvider.of<FSStoreBloc>(context).add(
      FSStoreUnregisterPost(token: getSSOToken(context)!, storeId: storeId)
  );
}