part of 'store_mgmt.dart';

/*
To improve readability, Use extension
 */

extension FSStoreMgmtPageUIFunctions on FSStoreMgmtPageState {
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
    return HeaderBarWidget(
      title: _s!.storeStoreMgmt,
      backgroundColor: AppColor.color1019,
    );
  }

  Widget _buildBody(){
    return Stack(
      children: [
        FSDivider(height: 55.h, color: AppColor.color1019),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // [ store info ]
              StoreInfoWidget(
                store: _store!,
                onDelete: () => _storeDeleteTapped(),
                onUpdate: () => _storeUpdateTapped(),
              ),
              SizedBox(height: 20.h,),
              // [ store rating ]
              Container(
                child: StoreRatingWidget(ratings: _ratings),
              ),
              SizedBox(height: 20.h,),
              // [ management of product, post, review ]
              Container(
                width: 335.w,
                height: 96.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    // [ Management of Product ]
                    InkWell(
                      onTap: () {
                        Map<String, dynamic> arguments = {'store': _store};
                        Navigator.of(context).pushNamed('fsproductmgmt', arguments: arguments).then((value){
                          // update FSStoreMgmtPage
                          setState(() {});
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 106.w,
                        height: 96.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.color1016,
                              blurRadius: 24.r,
                              offset: Offset(0, 8),
                            ),
                          ],
                          color: AppColor.color101,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                              width: 24.r,
                              height: 24.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/icon/prod_mgmt.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              _s!.storeMgmtProductMgmt,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.color1010,
                                fontSize: 16.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    // [ Management of Post ]
                    InkWell(
                      onTap: () {
                        if (_store!.products != null && _store!.products!.length > 0 && _store!.status == StoreStatus.NORMAL){
                          // start fspostreg
                          if (_post == null){
                            _postRegTapped();
                          }else{
                            _postCheckTapped();
                          }
                        }
                        else{
                          String msg = (_store!.status == StoreStatus.LOCKED) ? _s!.storeMgmtNotPostWhileLocked : _s!.storeMgmtAfterProdReg;

                          showAlertDialog(context,
                            msg,
                            null,
                            yes: _s!.commonOK,
                            yesOnPressed: () => Navigator.pop(context),
                          );
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 106.w,
                        height: 96.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.color1016,
                              blurRadius: 24.r,
                              offset: Offset(0, 8),
                            ),
                          ],
                          color: AppColor.color101,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                              width: 24.r,
                              height: 24.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/icon/post_mgmt.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              (_post != null) ? _s!.storeMgmtPostCheck : _s!.homeDrawerStartPost,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.color1010,
                                fontSize: 16.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    // [ Management of Review ]
                    InkWell(
                      onTap: (){
                        Map<String, dynamic> arguments = {'store': _store,};
                        Navigator.of(context).pushNamed('fsreviewmgmt', arguments: arguments).then((value){
                          // update FSStoreMgmtPage
                          setState(() {});
                        });
                      },
                      child: Container(
                        width: 106.w,
                        height: 96.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.color1016,
                              blurRadius: 24.r,
                              offset: Offset(0, 8),
                            ),
                          ],
                          color: AppColor.color101,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                              width: 24.r,
                              height: 24.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/icon/review_mgmt.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              _s!.storeMgmtReviewMgmt,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.color1010,
                                fontSize: 16.sp,
                                fontFamily: "SpoqaHanSansNeo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
              // [ store status : store is posting, not posting or locked or deleted ]
              _buildStoreStatus(),
              SizedBox(height: 32.h,),
              FSDivider(height: 9.h, color: AppColor.color1018),
              SizedBox(height: 24.h,),
              // [ title - Product ]
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _s!.commonProduct,
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 16.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              // [ total product ]
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            color: AppColor.color1009,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          _s!.storeMgmtAllProduct,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 16.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          _store!.products?.length.toString() ?? '0',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 18.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          _s!.storeMgmtItemUnit,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 14.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              // [ Product being posted ]
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            color: AppColor.color1009,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          _s!.storeMgmtPostedProduct,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 16.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          (_post != null) ?
                          _store!.products!.map((e) => e.active == true).toList().length.toString() : '0',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColor.color1019,
                            fontSize: 18.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          _s!.storeMgmtItemUnit,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 14.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h,),
              FSDivider(height: 9.h, color: AppColor.color1018),
              SizedBox(height: 24.h,),
              // [ title - Review ]
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _s!.commonReview,
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 16.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              // [ total Review ]
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            color: AppColor.color1009,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          _s!.storeFullReview,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 16.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          _store!.ratingCnt?.toString() ?? '0',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 18.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          _s!.storeMgmtItemUnit,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 14.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              // [ Unanswered reviews ]
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            color: AppColor.color1009,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          _s!.storeMgmtUnAnsweredReview,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 16.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                        _store!.unAnsweredReviewCount?.toString() ?? '0',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColor.color1019,
                            fontSize: 18.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          _s!.storeMgmtItemUnit,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 14.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h,),
              FSDivider(height: 9.h, color: AppColor.color1018),
              SizedBox(height: 25.h,),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoreStatus(){
    if (_store!.status == StoreStatus.NORMAL && _post == null) return _buildStoreNotPosted();
    else if (_store!.status == StoreStatus.NORMAL && _post != null) return _buildStorePosting();
    else if (_store!.status == StoreStatus.LOCKED) return _buildStoreLocked();
    else return _buildStoreDeleted();
  }

  Widget _buildStoreNotPosted(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 335.w,
      height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColor.color1019, width: 1.w, ),
        color: AppColor.color101,
      ),
      child: Row(
        children: [
          Text(
            _s!.storeMgmtNotBeingPosted,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.color1019,
              fontSize: 16.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.help,
              color: AppColor.color1019,
              size: 20,
            ),
            onPressed: (){
              showAlertDialog(context,
                _s!.storeMgmtNotBeingPosted,
                _s!.storeMgmtNotBeingPostedDesc,
                yes: _s!.commonOK,
                yesOnPressed: () => Navigator.pop(context),
                descTextAlign: TextAlign.left,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStorePosting(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 335.w,
      height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColor.color1019, width: 1.w, ),
        color: AppColor.color101,
      ),
      child: Row(
        children: [
          Text(
            _s!.storeMgmtBeingPosted,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.color1019,
              fontSize: 16.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.help,
              color: AppColor.color1019,
              size: 20,
            ),
            onPressed: (){
              showAlertDialog(context,
                _s!.storeMgmtBeingPosted,
                _s!.storeMgmtBeingPostedDesc,
                yes: _s!.commonOK,
                yesOnPressed: () => Navigator.pop(context),
                descTextAlign: TextAlign.left
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStoreLocked(){
    return InkWell(
      onTap: () => _getStoreReport(_store!.id),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: 335.w,
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColor.color1019, width: 1.w, ),
          color: AppColor.color101,
        ),
        child: Row(
          children: [
            Text(
              '${_s!.storeMgmtBeingLocked}${_s!.storeMgmtCheckReport}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.color1019,
                fontSize: 16.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.help,
                color: AppColor.color1019,
                size: 20,
              ),
              onPressed: (){
                showAlertDialog(context,
                  _s!.storeMgmtBeingLocked,
                  _s!.storeMgmtBeingLockedDesc,
                  yes: _s!.commonOK,
                  yesOnPressed: () => Navigator.pop(context),
                  descTextAlign: TextAlign.left,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreDeleted(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 335.w,
      height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColor.color1019, width: 1.w, ),
        color: AppColor.color101,
      ),
      child: Row(
        children: [
          Text(
            _s!.storeMgmtBeingDeleted,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.color1019,
              fontSize: 16.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.help,
              color: AppColor.color1019,
              size: 20,
            ),
            onPressed: (){
              showAlertDialog(context,
                _s!.storeMgmtBeingDeleted,
                _s!.storeMgmtBeingDeletedDesc,
                yes: _s!.commonOK,
                yesOnPressed: () => Navigator.pop(context),
                descTextAlign: TextAlign.left,
              );
            },
          ),
        ],
      ),
    );
  }
}

extension FSStoreMgmtPagePrivatePublicFunctions on FSStoreMgmtPageState {
  void _setStateData(){
    _s = S.of(context);

    _store = FSAppState.of(context).userInfo!.store![0];
    _storeOwner = FSAppState.of(context).userInfo!.storeOwner;
    _post = FSAppState.of(context).userInfo!.posting?[0] ?? null;
    _ratings = (_store!.ratings?.ratingsToSimpleMap()) ?? {'1': 0, '2': 0, '3': 0, '4': 0, '5': 0};
    _storeGiver = FSAppState.of(context).userInfo!.storeGiver ?? null;
  }

  void _postRegTapped(){
    Map<String, dynamic> arguments = {'store': _store,};
    Navigator.of(context).pushNamed('fspostreg', arguments: arguments).then((value){
      if(value != null && value is Map<String, dynamic>){
        setState(() {
          // success in starting post
          // add post in userInfo.post[0]
          _post = value['post'];
          UserInfo userInfo = FSAppState.of(context).userInfo!;
          userInfo.posting = []..add(_post);
          // change product's active to true if it is included in starting post
          _store!.products!.forEach((element) {
            if (value['products'].contains(element.id)) element.active = true;
            else element.active = false;
          });
          userInfo.store = []..add(_store);
          //FSAppState.of(context).setUserInfo(userInfo);
        });
      }
    });
  }

  void _postCheckTapped(){
    // goto store page with posting info
    // Calculate distance between me and the store
    double distanceInMeters = Geolocator.distanceBetween(FSAppState.of(context).lastLatLng!.latitude,
        FSAppState.of(context).lastLatLng!.longitude, double.parse(_post!.lat), double.parse(_post!.lng));
    _post!.distanceFromMe = distanceInMeters;
    Map<String, dynamic> arguments = {'post':  _post, 'stopPosting': true};
    Navigator.of(context).pushNamed('fsstore', arguments: arguments).then((value){
      if(value != null && value is ExtraUserInfo){
        fsHomePageKey.currentState!.postExpired(value);
      }
    });
  }

  void _storeUpdateTapped(){
    Map<String, dynamic> arguments = {'store': _store, 'storeOwner': _storeOwner};
    Navigator.of(context).pushNamed('fsstorereg', arguments: arguments).then((value){
      UserInfo? userInfo = FSAppState.of(context).userInfo;
      setState(() {
        if(value != null && value is Map<String, dynamic>){
          if (value['store'] != null){
            _store = value['store'];
            userInfo!.store = []..add(_store);
          }
          if (value['storeOwner'] != null)
            userInfo!.storeOwner = _storeOwner = value['storeOwner'];
          if (value['registration'] != null){
            _store!.businessReg = value['registration'];
            _store!.level = 2;
          }
        }
      });
      FSAppState.of(context).setUserInfo(userInfo);
    });
  }

  void _storeDeleteTapped(){
    if (_storeGiver != null){
      showAlertDialog(context,
        _s!.storeMgmtTransferredNotDeleted,
        null,
        yes: _s!.commonOK,
        yesOnPressed: (){
          Navigator.pop(context);
        },
      );
    }else{
      showAlertDialog(context,
        _s!.myStoreDeleteStore,
        _s!.storeMgmtStoreDataDeleted,
        yes: _s!.commonOK,
        yesOnPressed: (){
          Navigator.pop(context);
          _unRegisterStore(_store!.id,);
        },
        no: _s!.commonCancel,
        noOnPressed: () => Navigator.pop(context),
      );
    }
  }

  void _storeDeleted(){
    // register new store
    showAlertDialog(context,
      _s!.storeRegUnRegStoreSuccess,
      null,
      yes: _s!.commonOK,
      willPopupActive: true,
      yesOnPressed: (){
        // goto home page
        UserInfo userInfo = FSAppState.of(context).userInfo!;
        userInfo.storeOwner = null;
        userInfo.store = null;
        userInfo.posting = null;
        userInfo.type = constants.UserTypeUSER;
        fsHomePageKey.currentState!.setUserInfo(userInfo);
        Navigator.popUntil(context, ModalRoute.withName('fshome'));
      },
    );
  }

  void postExpired(){
    logger.d('${this.runtimeType} postExpired');
    setState(() {
      _post = null;
    });
  }

  void storeLocked(){
    logger.d('${this.runtimeType} storeLocked');
    setState(() {
      _store!.status = StoreStatus.LOCKED;
    });
  }
}

extension FSStoreMgmtPageEventFunctions on FSStoreMgmtPageState {
  /*
  define event-related functions in post page below.
  and add FsPostEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSStoreMgmtUnregisterStore) _unRegisterStore(event.storeId);
    if(event is FSStoreMgmtGetStoreReport) _getStoreReport(event.storeId);
  }

  void _unRegisterStore(storeId) => BlocProvider.of<FSStoreMgmtBloc>(context).add(
      FSStoreMgmtUnregisterStore(token: getSSOToken(context)!, storeId: storeId, )
  );

  void _getStoreReport(storeId) => BlocProvider.of<FSStoreMgmtBloc>(context).add(
      FSStoreMgmtGetStoreReport(token: getSSOToken(context)!, storeId: storeId, )
  );
}