import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart' as flutter_foundation;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:version/version.dart';

import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/flashsale/pages/pages.dart';
import 'package:comecsoft/push/push_manager.dart';
import 'package:comecsoft/admob/admob_manager.dart';

part 'home.ext.dart';

// define PageKeys globally
GlobalKey<FSHomePageState> fsHomePageKey = new GlobalKey();
GlobalKey<FSSettingsPageState> fsSettingsPageKey = new GlobalKey();
GlobalKey<FSPostPageState> fsPostPageKey = new GlobalKey();
GlobalKey<FSSearchPageState> fsSearchPageKey = new GlobalKey();
GlobalKey<FSStorePageState> fsStorePageKey = new GlobalKey();
GlobalKey<FSStoreRegPageState> fsStoreRegPageKey = new GlobalKey();
GlobalKey<FSStoreMgmtPageState> fsStoreMgmtPageKey = new GlobalKey();
GlobalKey<FSProductMgmtPageState> fsProductMgmtPageKey = new GlobalKey();
//GlobalKey<FSMyPostPageState> fsMyPostPageKey = new GlobalKey();
GlobalKey<FSReviewMgmtPageState> fsReviewMgmtPageKey = new GlobalKey();
GlobalKey<FSPostRegPageState> fsPostRegPageKey = new GlobalKey();
GlobalKey<FSStoreTransferPageState> fsStoreTransferPageKey = new GlobalKey();
GlobalKey<FSProductRegPageState> fsProductRegPageKey = new GlobalKey();
GlobalKey<FSReportPageState> fsReportPageKey = new GlobalKey();
GlobalKey<FSReviewRegPageState> fsReviewRegPageKey = new GlobalKey();
GlobalKey<FSPhoneVrfPageState> fsPhoneVrfPageKey = new GlobalKey();
GlobalKey<FSLocationPageState> fsLocationPageKey = new GlobalKey();


class FSHomePage extends StatefulWidget{
  const FSHomePage({
    Key? key,
  }) : super(key: key);

  @override
  FSHomePageState createState() => FSHomePageState();
}

class FSHomePageState extends State<FSHomePage> with WidgetsBindingObserver{
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<MapWidgetState> _mapScreenKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();
  GlobalKey<DrawerWidgetState> _drawerMenuKey = new GlobalKey();

  S? _s;                     //application localization

  List<MenuItem>? _subMenuItems;
  bool _buttonRightBase = true;
  bool _firstPeriodicUpdateOrRuleChanged = false;

  StreamSubscription? _periodicUpdateStreamSubscription;
  StreamSubscription<Position>? _positionUpdateStreamSubscription;

  DateTime? currentBackPressTime;            // back press time to exit

  PushMessageManager _pushMessageManager = PushMessageManager();
  FirebaseAdMobManager _firebaseAdMobManager = FirebaseAdMobManager();

  //first periodic update or rule changed
  set searchingRuleChanged(bool value) {
    logger.d('${this.runtimeType} searchingRuleChanged $value');
    logger.d('${this.runtimeType} ${FSAppState.of(context).searchingRule.toString()}');

    SearchingRule searchingRule = FSAppState.of(context).searchingRule!;
    LatLng? latLng = FSAppState.of(context).lastLatLng;

    if (searchingRule.mainRule == SearchingMaineRule.MyLocationBase && latLng == null){
      showAlertDialog(context,
        _s!.homeCurrentLocationUnknown,
        null,
        yes: _s!.commonOK,
        yesOnPressed: (){
          Navigator.pop(context);
        },
      );
    }else {
      _firstPeriodicUpdateOrRuleChanged = value;
      if (value)
        _sendPeriodicUpdate(FSAppState.of(context).lastLatLng, FSAppState.of(context).searchingRule!);
    }
  }

  @override
  void initState() {
    logger.d('${this.runtimeType} initState');
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    //initialize firebaseAdMobManager & load rewardedVideoAd
    _firebaseAdMobManager.init(_adMobEventCallback);
  }

  @override
  void didChangeDependencies() {
    logger.d('${this.runtimeType} didChangeDependencies');

    _s = S.of(context);

    if (_periodicUpdateStreamSubscription == null && _positionUpdateStreamSubscription == null) {
      // when app starts
      _sendInit();
    }

    // default submenu items in drawer
    if(_subMenuItems == null)
      _subMenuItems = [
        //MenuItem(_s!.storeMyReview, null, true, false, null),
        MenuItem(_s!.homeDrawerNotice, null, true, false, null),
        MenuItem(_s!.homeDrawerSettings, null, true, false, null),
        //MenuItem(_s!.homeDrawerHelp, null, true, false, null),
        MenuItem(_s!.homeDrawerWatchAD, null, (FirebaseAdMobManager.rewardedVideoAdLoaded) ? true : false, true, _s!.homeDrawerADComment),
        MenuItem(_s!.homeDrawerRegStore, null, false, false, null),
      ];

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    logger.d('${this.runtimeType} dispose');
    WidgetsBinding.instance!.removeObserver(this);
    _stopMapRelatedStreaming();
    _firebaseAdMobManager.dispose();
    _periodicUpdateStreamSubscription?.cancel();
    _positionUpdateStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.d('${this.runtimeType} didChangeAppLifecycleState : $state');
    switch (state) {
      case AppLifecycleState.paused:
        _stopMapRelatedStreaming();
        break;
      case AppLifecycleState.resumed:
        _startMapRelatedStreaming();
        _firstPeriodicUpdateOrRuleChanged = true;
        _sendPeriodicUpdate(FSAppState.of(context).lastLatLng, FSAppState.of(context).searchingRule!);
        // bugfix : Flutter GoogleMap is blank after resuming from background
        // https://stackoverflow.com/questions/59374010/flutter-googlemap-is-blank-after-resuming-from-background/59435683#59435683
        _mapScreenKey.currentState?.setMapStyle('[]');
        fsStorePageKey.currentState?.storeMapScreenKey.currentState?.setMapStyle('[]');
        fsLocationPageKey.currentState?.locationMapScreenKey.currentState?.setMapStyle('[]');
        break;
      case AppLifecycleState.inactive:
        _stopMapRelatedStreaming();
        break;
      case AppLifecycleState.detached:
        _stopMapRelatedStreaming();
        break;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _buildDrawer(),
      drawer: _buildDrawer(),
      drawerEdgeDragWidth: 0,
      body: SafeArea(
        child: BlocListener<FsHomeBloc, FSHomeState>(
          listener: (context, state) async{
            // process session related state
            if (state is FSHomeLoginRequired || state is FSHomeRefreshTokenRequired || state is FSHomeRefreshTokenSuccess){
              _precessSessionState(state);
            }
            // process admob related state
            else if (state is FSHomeAdMobEventReceivedState){
              _processAdmobState(state);
            }
            else if (state is FSHomeInitDone){
              logger.d('${this.runtimeType} FSHomeInitDone');

              _progressHUDKey.currentState!.show();

              if (_periodicUpdateStreamSubscription == null && _positionUpdateStreamSubscription == null){
                _firstPeriodicUpdateOrRuleChanged = true;
                // start positionUpdateStream only. start periodicUpdateStream after getting FSHomeGetInitUserDataSuccess
                _startPositionUpdateStream();

                // show user instruction page
                bool? userIntroShown = FSAppState.of(context).userIntroShown;
                if (userIntroShown == null || userIntroShown == false){
                   Navigator.of(context).pushNamed('fsuserintro').then((value){
                     FSAppState.of(context).setUserIntroShown(true);
                     _sendGetInitUserData();
                   });
                }else{
                  _sendGetInitUserData();
                }
              }
            }
            else if(state is FSHomeGetInitUserDataSuccess){
              logger.d('${this.runtimeType} FSHomeGetInitUserDataSuccess');

              // check service time
              _checkServiceTime(state);

              // check the latest version from server
              _checkTheLatestVersion(state);

              // save init data
              _saveInitData(state);

              // create categoryMap
              LinkedHashMap categoryMap = new LinkedHashMap<int, Category>();
              state.rootCategories?.forEach((element){
                Category.createCategoryMap(element, categoryMap);
              });
              FSAppState.of(context).setCategoryMap(categoryMap);

              List<Notice> unchecked = state.notices!;
              // show unchecked notices
              if(unchecked.length > 0){
                Map<String, dynamic> arguments = {'notices': unchecked};
                Navigator.of(context).pushNamed('fsnotice', arguments: arguments).then((onValue){
                  logger.d('${this.runtimeType} after unchecked notice : $onValue');
                  String readNotice = unchecked.map((e) => e.id).toList().join(',');
                  // Notify the server that unchecked notices have been read
                  _sendReadNotice(readNotice);
                });
                //_showNoticeDialog(unchecked);
              }

              // init push service here, in order for pushMessageEvent.onLaunch to work successfully after initializing FSAppState
              _pushMessageManager.init(_pushMessageCallback);

              _startPeriodicUpdateStream();
              _sendPeriodicUpdate(FSAppState.of(context).lastLatLng, FSAppState.of(context).searchingRule!);
            }
            else if(state is FSHomeGetInitUserDataFailure){
              showAlertDialog(context,
                _s!.commonNetworkError,
                sprintf('%s\n%s', [state.comment, _s!.commonConnectAgain]),
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                  _sendGetInitUserData();
                },
                no: _s!.commonCancel,
                noOnPressed: () => closeApp(),
              );
            }
            else if(state is FSHomeLocationUpdateDone){
              logger.d('${this.runtimeType} FSHomeLocationUpdateDone');
              _mapScreenKey.currentState!.updateMyLocation(state.position, FSAppState.of(context).posts, FSAppState.of(context).searchingRule!);
              FSAppState.of(context).setLastLatLng(state.position);

              // get first position updated after start or resume
              if (state.first! && FSAppState.of(context).searchingRule!.mainRule == SearchingMaineRule.MyLocationBase){
                logger.d('${this.runtimeType} FSHomeLocationUpdateDone get first position updated after start or resume');
                _firstPeriodicUpdateOrRuleChanged = true;
                _sendPeriodicUpdate(FSAppState.of(context).lastLatLng, FSAppState.of(context).searchingRule!);
              }
            }
            else if(state is FSHomePeriodicUpdateSuccess){
              logger.d('${this.runtimeType} FSHomePeriodicUpdateSuccess');

              // store all postings in FSAppState
              FSAppState.of(context).setPosts(state.posts);
              // update searching rule
              SearchingRule? searchingRule = FSAppState.of(context).searchingRule;

              // first periodic update or district changed
              if(_firstPeriodicUpdateOrRuleChanged){
                logger.d('${this.runtimeType} FSHomePeriodicUpdateSuccess _firstPeriodicUpdateOrRuleChanged ${searchingRule!.mainRule}');
                if(searchingRule.mainRule == SearchingMaineRule.DistrictBase){
                  // save LocAddress in shared preferences
                  FSAppState.of(context).addAddressNode(state.address!);
                  searchingRule.district = state.address;
                  FSAppState.of(context).setSearchingRule(searchingRule);
                }

                _mapScreenKey.currentState!.updateMyLocation(FSAppState.of(context).lastLatLng,
                    FSAppState.of(context).posts, FSAppState.of(context).searchingRule!);

                if(searchingRule.mainRule == SearchingMaineRule.MyLocationBase)
                  _mapScreenKey.currentState!.goToLocation(FSAppState.of(context).lastLatLng);
                else if(searchingRule.mainRule == SearchingMaineRule.DistrictBase)
                  _mapScreenKey.currentState!.goToLocation(searchingRule.district!.center);

                if (_progressHUDKey.currentState!.barrierVisible){
                  _progressHUDKey.currentState!.dismiss();
                }

                _firstPeriodicUpdateOrRuleChanged = false;
              }

              // update marker with selectedPostings
              updateMarker(state.posts, FSAppState.of(context).searchingRule!);
            }
            else if(state is FSHomePeriodicUpdateFailure){
              logger.d('${this.runtimeType} FSHomePeriodicUpdateFailure');

              if(_firstPeriodicUpdateOrRuleChanged) {
                logger.d('${this.runtimeType} FSHomePeriodicUpdateFailure _firstPeriodicUpdateOrRuleChanged');

                if (_progressHUDKey.currentState!.barrierVisible){
                  _progressHUDKey.currentState!.dismiss();
                }

                _firstPeriodicUpdateOrRuleChanged = false;
              }

              // If you decrease or increase Google Maps when displaying flushbar, a null point exception occurs.
              // showAlertFlushBar(context, _s.commonNetworkError, sprintf('%s\n%s', [state.comment, _s.commonConnectAgainLater]));
              showAlertSnackBar(context, _s!.commonNetworkError + '. ' + _s!.commonConnectAgainLater);
            }
            else if(state is FSHomeRegisterPushTokenSuccess){
              logger.d('${this.runtimeType} FSHomeRegisterPushTokenSuccess');
              setPushToken(context, state.pushToken);
            }
            else if(state is FSHomeRegisterPushTokenFailure){
              logger.d('${this.runtimeType} FSHomeRegisterPushTokenFailure');
            }
            else if(state is FSHomeGetMyNoticesSuccess){
              logger.d('${this.runtimeType} FSHomeGetMyNoticesSuccess');

              if (state.notices!.length > 0){
                Map<String, dynamic> arguments = {'notices': state.notices};
                Navigator.of(context).pushNamed('fsnotice', arguments: arguments).then((onValue){
                  logger.d('${this.runtimeType} after notice: $onValue');
                });
              }else{
                showAlertDialog(context,
                  _s!.homeDrawerNoNotice,
                  null,
                  yes: _s!.commonOK,
                  yesOnPressed: () => Navigator.pop(context),
                );
              }
            }
            else if(state is FSHomeGetMyNoticesFailure){
              logger.d('${this.runtimeType} FSHomeGetMyNoticesFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }
          },
          child: WillPopScope(
            onWillPop: _onWillPop,
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
      ),
    );
  }

  Future<bool> _onWillPop() {
    if (Navigator.of(context).canPop()){
      return Future.value(true);
    }else{
      DateTime now = DateTime.now();

      if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        showSnackBar(context, _s!.homeExitApp, 2);
        return Future.value(false);
      }else{
        // to fix 'Cannot execute operation because FlutterJNI is not attached to native'
        // In Android MainActivity.kt, just add this:
        // override fun onDestroy() { flutterEngine?.platformViewsController?.onFlutterViewDestroyed(); super.onDestroy(); }
        // https://stackoverflow.com/questions/61330428/flutter-webview-exception-on-device-back-button-pressed
        return Future.value(true);
      }
    }
  }

  Widget _buildDrawer() {
    dynamic appU = getUser(context);

    return ClipPath(
      clipper: (_buttonRightBase) ? OvalLeftBorderClipper() : OvalRightBorderClipper(),
      child: Drawer(
        child: DrawerWidget(
            key: _drawerMenuKey,
            subMenuItems: _subMenuItems,
            name: appU?.name,
            photoUrl: appU?.photoUrl,
            email: appU?.email,
            onTap: _drawerMenuTapped
        ),
      ),
    );
  }
}