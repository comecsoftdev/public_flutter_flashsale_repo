part of 'home.dart';


/*
To improve readability, Use extension
 */

extension FSHomePageUIFunctions on FSHomePageState {
  Widget _buildPage() {
    return Center(
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColor.color101,
      height: 50.h,
      padding: EdgeInsets.fromLTRB(20.w, 0, 10.w, 0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                // [ location name ]
                InkWell(
                  onTap: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
                    ),
                    context: context,
                    builder: (BuildContext context){
                      return LocationSelectionWidget(onTap: _locationSearchingRuleChanged);
                    },
                    barrierColor: AppColor.color203,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 190.w,
                        ),
                        child: Text(
                          getCurrentLocName(),
                          style: TextStyle(
                            color: AppColor.color1010,
                            fontSize: 18.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 12.r,
                        height: 12.r,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/icon/arrow_drop_down.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ),
                Spacer(),
                // [ search ]
                InkWell(
                  onTap: () {
                    // Map<String, dynamic> arguments = {'post': FSAppState.of(context).posts, };
                    Navigator.of(context).pushNamed('fssearch');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    width: 24.r,
                    height: 24.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon/search.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                // [ select category ]
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
                      ),
                      context: context,
                      builder: (BuildContext context){
                        return CategoryGridMenuWidget(categories: FSAppState.of(context).rootCategories, selected: FSAppState.of(context).searchingRule!.categories, onChanged: _categoryChanged);
                      },
                      barrierColor: AppColor.color203,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    width: 24.r,
                    height: 24.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon/category.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                // [ drawer menu ]
                InkWell(
                  onTap: () => _drawerTapped(),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    width: 24.r,
                    height: 24.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon/menu_b.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    LatLng center;

    if (FSAppState.of(context).lastLatLng == null){
      center = LatLng(constants.defaultLat, constants.defaultLng);
    }else if (FSAppState.of(context).searchingRule!.mainRule == SearchingMaineRule.MyLocationBase){
      center = FSAppState.of(context).lastLatLng!;
    }else{
      center = FSAppState.of(context).searchingRule!.district!.center!;
    }

    List<Widget> widgetsInHome = [];

    widgetsInHome.add(
        MapWidget(
          key: _mapScreenKey,
          center: center,
          onTap: _markerTapped,
          zoom: 14,
        )
    );

    if (FSAppState.of(context).userInfo?.storeOwner != null){
      widgetsInHome.add(
          Positioned(
            bottom: 30.h,
            left: 80.w,
            child: _storeManagement(),
          )
      );

      widgetsInHome.add(
          Positioned(
            bottom: 30.h,
            left: 210.w,
            child: _storeList(),
          )
      );

      widgetsInHome.add(
          Positioned(
            bottom: 30.h,
            right: 20.w,
            child: _myLocation(),
          )
      );
    }else{
      widgetsInHome.add(
        Positioned(
          bottom: 30.h,
          left: 137.w,
          child: _storeList(),
        )
      );

      widgetsInHome.add(
        Positioned(
          bottom: 30.h,
          right: 20.w,
          child: _myLocation(),
        )
      );
    }

    return Stack(
        children: widgetsInHome
    );
  }

  Widget _storeList(){
    return Container(
      width: 100.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4.r,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          //Map<String, dynamic> arguments = {'post': FSAppState.of(context).posts, };
          Navigator.of(context).pushNamed('fspost');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon/list_view.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 4),
            Text(
              _s!.postListStoreList,
              style: TextStyle(
                color: Color(0xff333333),
                fontSize: 14.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storeManagement(){
    return Container(
      width: 120.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4.r,
            offset: Offset(0, 4),
          ),
        ],
        color: Color(0xff2ec988),
      ),
      child: InkWell(
        onTap: () {
          // Map<String, dynamic> arguments = {'userInfo': FSAppState.of(context).userInfo, 'fSettings': FSAppState.of(context).fSettings};
          Navigator.of(context).pushNamed('fsstoremgmt');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon/store_w.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 4),
            Text(
              _s!.storeStoreMgmt,
              style: TextStyle(
                color: Color(0xff333333),
                fontSize: 14.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myLocation(){
    return InkWell(
      onTap: () => _goToMyLocation(),
      child: Container(
        width: 40.r,
        height: 40.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 24.r,
            height: 24.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/icon/my_location.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension FSHomePageInitDataFunctions on FSHomePageState {
  void _checkServiceTime(state) async{
    DateTime now = DateTime.now();
    DateTime svcStartTime =  DateTime(now.year, now.month, now.day, state.fSettings.l3STime);
    DateTime svcEndTime =  DateTime(now.year, now.month, now.day, state.fSettings.l3ETime);

    if (now.isAfter(svcEndTime) || now.isBefore(svcStartTime)){
      showAlertDialog(context,
        _s!.postRegPostingTime,
        _s!.homeServiceTimeWarning(state.fSettings.l3STime, state.fSettings.l3ETime),
        yes: _s!.commonOK,
        yesOnPressed: () => Navigator.pop(context),
      );

      // if (result == _s!.commonOK){
      //   closeApp();
      // }
    }
  }

  void _checkTheLatestVersion(state){
    Version currentVersion = Version.parse(getPackageInfo(context).version);
    Version latestVersion = Version.parse(state.fSettings!.appVer ?? getPackageInfo(context).version);

    if(latestVersion.major > currentVersion.major || latestVersion.minor > currentVersion.minor){
      // Forced version update
      showAlertDialog(context,
        _s!.homeUpdateRequired,
        null,
        yes: _s!.commonOK,
        yesOnPressed: (){
          // goto app store
          goToAppStore(getPackageInfo(context).packageName);
        },
        no: _s!.commonCancel,
        noOnPressed: () => closeApp(),
        willPopupActive: true,
      );
    }else if(latestVersion.patch > currentVersion.patch){
      // Optional version update
      showAlertDialog(context,
        _s!.homeWantToUpdate,
        null,
        yes: _s!.commonOK,
        yesOnPressed: (){
          // goto app store
          goToAppStore(getPackageInfo(context).packageName);
          Navigator.pop(context);
        },
        no: _s!.commonNextTime,
        noOnPressed: () {
          // goto next step
          Navigator.pop(context);
        },
      );
    }
  }

  void _saveInitData(state){
    setState(() {
      FSAppState.of(context).setUserInfo(state.userInfo);
      // if addressBook stored in shared preference, No addressBook returned from server.
      // so don't store null addressBook in in shared preference
      if (state.addressBook != null) FSAppState.of(context).setAddressBook(state.addressBook);
      FSAppState.of(context).setCategory(state.rootCategories);
      FSAppState.of(context).setWhattobuySettings(state.fSettings);

      // change searching rule's distance if it is different from server. this will be applied later
      /*
                SearchingRule searchingRule = FSAppState.of(context).searchingRule!;
                if (searchingRule.distance != state.fSettings!.distanceLimit){
                  searchingRule.distance = state.fSettings!.distanceLimit;
                  FSAppState.of(context).setSearchingRule(searchingRule);
                }
                 */
    });
  }
}

extension FSHomePageStreamingFunctions on FSHomePageState {
  // call _startMapRelatedStreaming after initializing home
  void _startMapRelatedStreaming(){
    logger.d('${this.runtimeType} _startMapRelatedStreaming');

    _startPeriodicUpdateStream();

    _startPositionUpdateStream();
  }

  void _startPeriodicUpdateStream(){
    logger.d('${this.runtimeType} _startPeriodicUpdateStream');

    if (_periodicUpdateStreamSubscription == null){
      // start periodic update stream
      if(flutter_foundation.kReleaseMode){
        logger.d('${this.runtimeType} periodicUpdate every ${constants.PeriodicUpdateTime}min');
        _periodicUpdateStreamSubscription = Stream.periodic(const Duration(minutes: constants.PeriodicUpdateTime))
            .listen((count) => _sendPeriodicUpdate(FSAppState.of(context).lastLatLng, FSAppState.of(context).searchingRule!));
      }else{
        logger.d('${this.runtimeType} periodicUpdate every 10sec');
        _periodicUpdateStreamSubscription = Stream.periodic(const Duration(seconds: 10))
            .listen((count) => _sendPeriodicUpdate(FSAppState.of(context).lastLatLng, FSAppState.of(context).searchingRule!));
      }
    }
  }

  void _startPositionUpdateStream(){
    logger.d('${this.runtimeType} _startPositionUpdateStream');

    if (_positionUpdateStreamSubscription == null) {                                       // start location change stream
      const LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);
      Geolocator.getPositionStream(distanceFilter: 10).first.then((Position position){
        logger.d('${this.runtimeType} _startPositionUpdateStream first positionUpdated $position');
        _sendLocationUpdate(LatLng(position.latitude, position.longitude), first: true);
      });
      _positionUpdateStreamSubscription = Geolocator.getPositionStream(distanceFilter: 10).listen((Position position){
        logger.d('${this.runtimeType} _startPositionUpdateStream positionUpdated $position');
        // todo for test
        _sendLocationUpdate(LatLng(position.latitude, position.longitude));
        //_sendLocationUpdate(LatLng(37.555658, 126.922902));
      });
    }
  }

  void _stopMapRelatedStreaming(){
    logger.d('${this.runtimeType} _stopMapRelatedStreaming');

    if (_periodicUpdateStreamSubscription != null){
      _periodicUpdateStreamSubscription!.cancel();
      _periodicUpdateStreamSubscription = null;
    }

    if (_positionUpdateStreamSubscription != null){
      _positionUpdateStreamSubscription!.cancel();
      _positionUpdateStreamSubscription = null;
    }
  }
}

extension FSHomePageSessionFunctions on FSHomePageState {
  /*
  process session related state
   */
  void _precessSessionState(state){
    if(state is FSHomeLoginRequired){
      // if refreshToken failed, goto LoginPage
      signOutCleanup(context);

      logger.d('${this.runtimeType} FSHomeLoginRequired');
      _stopMapRelatedStreaming();
      showAlertDialog(context,
        _s!.loginSessionExpired,
        _s!.loginTryAgain,
        yes: _s!.commonOK,
        yesOnPressed: (){
          // push all pages and go to login page
          Navigator.of(context).pushNamedAndRemoveUntil(getSSOSigninpage(context)!, (Route<dynamic> route) => false);
        },
        no: _s!.commonCancel,
        noOnPressed: () => closeApp(),
        willPopupActive: true,
      );
    }else if(state is FSHomeRefreshTokenRequired){
      logger.d('${this.runtimeType} FSHomeRefreshTokenRequired eventToResend : ${state.eventToResend}');
      sendRefreshToken(state.eventToResend);
    }else if(state is FSHomeRefreshTokenSuccess){
      // refresh token success
      logger.d('${this.runtimeType} FSHomeRefreshTokenSuccess eventToResend : ${FSAppState.of(context).eventToResend}');
      setSSOToken(context, state.token);
      if(FSAppState.of(context).eventToResend != null){
        sendEventToResend(FSAppState.of(context).eventToResend);
      }
    }
  }
}

extension FSHomePageAdmobFunctions on FSHomePageState {
  /*
  process admob related state
   */
  void _adMobEventCallback(googleVideoAdEvent event, {dynamic reward}) {
    logger.d("_HomePageState rewardedVideoListener event: $event");
    BlocProvider.of<FsHomeBloc>(context).add(FSHomeAdMobEventReceived(event: event, reward: reward));
  }

  void _processAdmobState(state){
    logger.d("${this.runtimeType} AdMobEventReceivedState ${state.event}");
    switch (state.event) {
      case googleVideoAdEvent.loaded:
        logger.d("${this.runtimeType} RewardedVideoAdEvent.loaded");
        setDrawerMenuEnable(S.of(context).homeDrawerWatchAD, true);
        break;

      case googleVideoAdEvent.rewarded:
        logger.d("${this.runtimeType} RewardedVideoAdEvent.rewarded ${state.reward?.type}, ${state.reward?.amount}");
        // send reward to server.
        break;

      case googleVideoAdEvent.closed:
        setDrawerMenuEnable(S.of(context).homeDrawerWatchAD, false);
        logger.d("${this.runtimeType} RewardedVideoAdEvent.closed");
        //_firebaseAdMobManager.loadRewardedVideoAd();
        break;

      case googleVideoAdEvent.failedToLoad:
        break;

      case googleVideoAdEvent.opened:
        break;

      case googleVideoAdEvent.leftApplication:
        break;
    }
  }
}

extension FSHomePageCBFunctions on FSHomePageState {
  /*
  callback functions
   */
  void _pushMessageCallback(PushMessageEvent pushMessageEvent, {Map<String, dynamic>? message, String? pushToken}) {
    logger.d("_HomePageState _pushMessageCallback event: $pushMessageEvent ");

    if(pushMessageEvent == PushMessageEvent.getToken){
      String? appPushToken = getPushToken(context);

      if (appPushToken == '' || appPushToken != pushToken){
        // send token to application server
        _sendRegisterPushToken(pushToken);
      }
    }else{
      logger.d('${this.runtimeType} pushMessageReceived $message');
      logger.d('${this.runtimeType} pushMessageReceived ${message!['message']}');

      /*
      message!['message'] = [{\"extra_user_info\": {\"r_p_time_day\": 119, \"r_p_time_week\": 479}, \"type\": 0}]
                            [{\"extra_user_info\": {\"r_p_time_day\": 107, \"r_p_time_week\": 466}, \"type\": 0}, {\"type\": 1}]
      */
      List<PushMessage?>? pushMessages = (jsonDecode(message['message']) as List?)?.map(
              (e) => e == null ? null : PushMessage.fromJson(e as Map<String, dynamic>)
      )?.toList();

      logger.d('${this.runtimeType} pushMessageReceived $pushMessages');

      pushMessages!.forEach((element) {
        if (element!.type == PushMessageType.PostExpired.index){
          postExpired(element.extraUserInfo);
        }else if(element.type == PushMessageType.StoreLocked.index){
          storeLocked();
        }
      });
    }
  }

  void _categoryChanged({List<int>? selected}){
    SearchingRule searchingRule = FSAppState.of(context).searchingRule!;

    if(selected != null){
      searchingRule.categories!.clear();
      selected.forEach((element) => searchingRule.categories!.add(element));
    }

    FSAppState.of(context).setSearchingRule(searchingRule);

    // update marker with selectedPostings
    updateMarker(FSAppState.of(context).posts, FSAppState.of(context).searchingRule!);
  }

  void _locationSearchingRuleChanged(LocationSelectionType type) async{
    logger.d('${this.runtimeType} _locationSearchingRuleChanged $type');

    SearchingRule searchingRule = FSAppState.of(context).searchingRule!;

    if(type == LocationSelectionType.MyLocation){
      _goToMyLocation();
    }else if(type == LocationSelectionType.LocationHistory){
      final result = await showSideSheetAsync(
        context: context,
        content: LocationSelectionLocAddressWidget(
          locAddresses: FSAppState.of(context).addressNodes!.values.toList(),
          onTap: (selected){
            Navigator.pop(context, selected);
          },
        ),
        width: 300.w,
        height: 300.h,
        bottom: 10.h,
        barrierColor: AppColor.color90,
      );

      if (result != null){
        searchingRule.mainRule = SearchingMaineRule.DistrictBase;
        searchingRule.district = result;
        FSAppState.of(context).setSearchingRule(searchingRule);
        fsHomePageKey.currentState!.searchingRuleChanged = true;

        setState(() { });
      }
    }else if(type == LocationSelectionType.LocationDirect){
      // close LocationSelectionWidget()
      Navigator.pop(context);
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        ),
        context: context,
        builder: (BuildContext context){
          return LocationSelectionDirectWidget(
            nodes: FSAppState.of(context).addressBook!.addr,
            onTap: (selected){
              if (selected != null){
                searchingRule.mainRule = SearchingMaineRule.DistrictBase;
                searchingRule.district = selected;
                FSAppState.of(context).setSearchingRule(searchingRule);
                fsHomePageKey.currentState!.searchingRuleChanged = true;

                setState(() { });
              }
            },
          );
        },
        barrierColor: AppColor.color203,
      );
    }
  }

  void _noticeIndexChanged(List<Notice> notices, int index){
    logger.d('${this.runtimeType} _noticeIndexChanged $index -> index : $notices[index].id');
    notices.firstWhere((element) => element.id == notices[index].id).checked = true;
  }

  void _drawerTapped(){
    // check if user has his own store. if he is not owner, enable store registration menu
    if (FSAppState.of(context).userInfo!.storeOwner == null && FSAppState.of(context).userInfo!.store == null)
      setDrawerMenuEnable(S.of(context).homeDrawerRegStore, true);
    else setDrawerMenuEnable(S.of(context).homeDrawerRegStore, false);

    // if rewardedVideoAdLoaded is loaded, enable watch ad menu
    // if rewardedVideoAdLoaded isn't loaded, disable watch ad menu & load ad
    if (FirebaseAdMobManager.rewardedVideoAdLoaded)
      setDrawerMenuEnable(S.of(context).homeDrawerWatchAD, true);
    else{
      setDrawerMenuEnable(S.of(context).homeDrawerWatchAD, false);
      //_firebaseAdMobManager.loadRewardedVideoAd();
    }

    (_buttonRightBase)? _scaffoldKey.currentState!.openEndDrawer() : _scaffoldKey.currentState!.openDrawer();
  }

  void _drawerMenuTapped(String title){
    logger.d('${this.runtimeType} _drawerMenuTapped $title');

    if (title == S.of(context).homeDrawerNotice){
      _sendGetMyNotices();
      // if (FSAppState.of(context).notices!.length > 0)
      //   _showNoticeDialog(FSAppState.of(context).notices!);
      // else
      //   showAlertDialog(context,
      //     _s!.homeDrawerNoNotice,
      //     null,
      //     yes: _s!.commonOK,
      //     yesOnPressed: () => Navigator.pop(context),
      //   );
    }else if(title == S.of(context).homeDrawerSettings){
      Navigator.of(context).popAndPushNamed('fssettings', arguments: getUser(context),);
    }else if (title == S.of(context).homeDrawerWatchAD){
      _firebaseAdMobManager.showRewardedVideoAd();
    }else if (title == S.of(context).homeDrawerRegStore){
      Map<String, dynamic> arguments = {'store': null, 'storeOwner': null};
      Navigator.of(context).popAndPushNamed('fsstorereg', arguments: arguments);
    }else if (title == S.of(context).storeMyReview){
      // Navigator.of(context).popAndPushNamed('fsmanagerintro');
    }
  }

  void _markerTapped(List<dynamic> postings){
    logger.d('${this.runtimeType} _markerTapped ${postings.length}');
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
      ),
      context: context,
      builder: (BuildContext context){
        return BottomPostListWidget(postings: postings, onTap: _postingTapped,);
      },
      barrierColor: AppColor.color203,
    );
  }

  void _postingTapped(Posting posting){
    logger.d('${this.runtimeType} _postingTapped ${posting.name}');

    // goto store page with posting info
    Map<String, dynamic> arguments = {'post':  posting,};
    Navigator.of(context).pushNamed('fsstore', arguments: arguments);
  }

  void postExpired(extra){
    logger.d('${this.runtimeType} postExpired $extra');

    UserInfo userInfo = FSAppState.of(context).userInfo!;

    userInfo.extraUserInfo = extra;
    if (userInfo.extraUserInfo!.rPostingTimeWeek < 0) userInfo.extraUserInfo!.rPostingTimeWeek = 0;

    // change FSAppState.of(context).userInfo's posting
    userInfo.posting = null;

    FSAppState.of(context).setUserInfo(userInfo);

    logger.d('${this.runtimeType} postExpired setUserInfo');

    showAlertDialog(context,
      _s!.commonPostingExpired,
      null,
      yes: _s!.commonOK,
      willPopupActive: true,
      yesOnPressed: (){
        Navigator.pop(context);
        fsStoreMgmtPageKey.currentState?.postExpired?.call();
        //fsMyPostPageKey.currentState?.postExpired?.call();
        fsPostRegPageKey.currentState?.postExpired?.call();
      },
    );
  }

  void storeLocked(){
    logger.d('${this.runtimeType} storeLocked');

    UserInfo userInfo = FSAppState.of(context).userInfo!;
    userInfo.store![0]!.status = StoreStatus.LOCKED;
    FSAppState.of(context).setUserInfo(userInfo);

    showAlertDialog(context,
      _s!.myStoreToBeLocked,
      null,
      yes: _s!.commonOK,
      yesOnPressed: (){
        Navigator.pop(context);
        fsStoreMgmtPageKey.currentState?.storeLocked?.call();
        fsPostRegPageKey.currentState?.storeLocked?.call();
      },
    );
  }
}

extension FSHomePageEventFunctions on FSHomePageState {
  /*
  define event-related functions in Home page below.
  and add FSHomeEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase? event){
    FSAppState.of(context).setEventToResend(null);
    if (event is FSHomeInit) _sendInit();
    else if(event is FSHomeGetInitUserData) _sendGetInitUserData();
    else if(event is FSHomePeriodicUpdate) _sendPeriodicUpdate(event.position, FSAppState.of(context).searchingRule!);
    else if(event is FSHomeLocationUpdate) return;
    else if(event is FSHomeRegisterPushToken) _sendRegisterPushToken(event.pushToken);
    else if(event is FSHomeReadNotice) _sendReadNotice(event.notice);
    else if(event is FSHomeGetMyNotices) _sendGetMyNotices();
    else if(event is FSSettingsEvent) fsSettingsPageKey.currentState!.sendEventToResend(event);
    // else if(event is FSPostEvent) fsPostPageKey.currentState!.sendEventToResend(event);
    else if(event is FSStoreEvent) fsStorePageKey.currentState!.sendEventToResend(event);
    else if(event is FSStoreTransferEvent) fsStoreTransferPageKey.currentState!.sendEventToResend(event);
    else if(event is FSStoreRegEvent) fsStoreRegPageKey.currentState!.sendEventToResend(event);
    else if(event is FSStoreMgmtEvent) fsStoreMgmtPageKey.currentState!.sendEventToResend(event);
    else if(event is FSPostRegEvent) fsPostRegPageKey.currentState!.sendEventToResend(event);
    else if(event is FSProductRegEvent) fsProductRegPageKey.currentState!.sendEventToResend(event);
    else if(event is FSReportEvent) fsReportPageKey.currentState!.sendEventToResend(event);
    else if(event is FSPhoneVrfEvent) fsPhoneVrfPageKey.currentState!.sendEventToResend(event);
    else if(event is FSProductMgmtEvent) fsProductMgmtPageKey.currentState!.sendEventToResend(event);
    // else if(event is FSMyPostEvent) fsMyPostPageKey.currentState!.sendEventToResend(event);
    else if(event is FSReviewMgmtEvent) fsReviewMgmtPageKey.currentState!.sendEventToResend(event);
  }

  void sendRefreshToken(event){
    FSAppState.of(context).setEventToResend(event);
    BlocProvider.of<FsHomeBloc>(context).add(FSHomeRefreshToken(token: getSSOToken(context)!, refresh: getSSORefreshToken(context)!));
  }

  void _sendInit() => BlocProvider.of<FsHomeBloc>(context).add(FSHomeInit());

  void _sendGetInitUserData(){
    AddressBook? addressBook = FSAppState.of(context).addressBook;
    String extra = (addressBook == null) ? 'category, address, notice' : 'category, notice';
    BlocProvider.of<FsHomeBloc>(context).add(FSHomeGetInitUserData(token: getSSOToken(context)!, extra: extra));
  }

  void _sendPeriodicUpdate(LatLng? position, SearchingRule selectRule){
    if (selectRule.mainRule == SearchingMaineRule.MyLocationBase && position == null){
      logger.d('${this.runtimeType} _sendPeriodicUpdate rule is MyLocationBase and position is null');
    }else{
      logger.d('${this.runtimeType} _sendPeriodicUpdate $position');

      /*
      if (selectRule.mainRule == SearchingMaineRule.DistrictBase){
        // check if selectRule.district is stored in shared preferences
        LinkedHashMap<String, LocAddress> addressNodes = FSAppState.of(context).addressNodes!;
        LocAddress? locAddress = addressNodes[selectRule.district!.id.toString()];
        if (locAddress != null) selectRule.district = locAddress;
      }
      */

      BlocProvider.of<FsHomeBloc>(context).add(FSHomePeriodicUpdate(token: getSSOToken(context)!, position: position!, searchingRule: selectRule));
    }
  }

  void _sendLocationUpdate(LatLng latLng, {bool first = false}) => BlocProvider.of<FsHomeBloc>(context).add(FSHomeLocationUpdate(
      position: latLng, first: first));

  void _sendRegisterPushToken(pushToken) => BlocProvider.of<FsHomeBloc>(context).add(FSHomeRegisterPushToken(token: getSSOToken(context)!, pushToken: pushToken));

  // Notify the server that notices have been read
  void _sendReadNotice(notice) => BlocProvider.of<FsHomeBloc>(context).add(FSHomeReadNotice(token: getSSOToken(context)!, notice: notice));

  void _sendGetMyNotices() => BlocProvider.of<FsHomeBloc>(context).add(FSHomeGetMyNotices(token: getSSOToken(context)!));
}

extension FSHomePagePrivatePublicFunctions on FSHomePageState {
  void _goToMyLocation(){
    SearchingRule searchingRule = FSAppState.of(context).searchingRule!;

    searchingRule.mainRule = SearchingMaineRule.MyLocationBase;
    FSAppState.of(context).setSearchingRule(searchingRule);

    fsHomePageKey.currentState!.searchingRuleChanged = true;

    setState(() { });
  }

  void updateMarker(List<dynamic>? posts, SearchingRule rule){
    _mapScreenKey.currentState!.updateMarker(posts, rule);
  }

  void setDrawerMenuEnable(String menu, bool enable){
    setState(() {
      MenuItem? item = _subMenuItems!.singleWhere((item) => item.title == menu);
      item.enabled = enable;
    });
  }

  void setUserInfo(userInfo){
    setState(() {
      FSAppState.of(context).setUserInfo(userInfo);
    });
  }

  void categoryChanged({List<int>? selected}){
    _categoryChanged(selected: selected);
  }

  String getCurrentLocName(){
    SearchingRule? searchingRule = FSAppState.of(context).searchingRule!;

    if (searchingRule.mainRule == SearchingMaineRule.MyLocationBase){
      return _s!.searchingRuleAtCurrentLocation;
    }else{
      return searchingRule.district!.name;
    }
  }
}
