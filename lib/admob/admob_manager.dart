import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:comecsoft/utils/utils.dart';

// refer to https://pub.dev/packages/google_mobile_ads
// if you get this error message - Ad failed to load : 3
// refer to https://stackoverflow.com/questions/43884621/rewarded-video-ads-failed-to-load-ad-error-code-3-admob/49547972

enum googleVideoAdEvent {
  loaded,
  failedToLoad,
  opened,
  closed,
  leftApplication,
  rewarded,
}

const int LOAD_AD_TIME_IN_MIN = 1;

class FirebaseAdMobManager{
  static bool rewardedVideoAdLoaded = false;
  late RewardedAd myRewarded;
  Timer? _loadAdTimer;

  String unitId = Platform.isIOS
  // iOS Test RewardBasedVideoAdUnitId
      ? env['Google_AD_UNIT_id_IOS']!
  //    ? 'ca-app-pub-3940256099942544/5224354917'
  // Android Test RewardBasedVideoAdUnitId
      : env['Google_AD_UNIT_id_ANDROID']!;
  //    : 'ca-app-pub-3940256099942544/5224354917';

  final PublisherAdRequest request = PublisherAdRequest(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.dev',
    customTargeting: <String, String>{'some': 'targeting'},
    customTargetingLists: <String, List<String>>{'favoriteColors': <String>['red', 'yellow']},
  );

  // init & load rewardedVideoAd
  void init(_adMobEventCallback) async{
    logger.d("${this.runtimeType} FirebaseAdMobManager init");

    final AdListener listener = AdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) {
        rewardedVideoAdLoaded = true;
        _adMobEventCallback(googleVideoAdEvent.loaded);
      },
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        _adMobEventCallback(googleVideoAdEvent.failedToLoad);
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => _adMobEventCallback(googleVideoAdEvent.opened),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) {
        ad.dispose();
        rewardedVideoAdLoaded = false;
        _adMobEventCallback(googleVideoAdEvent.closed);
      },
      // Called when an ad is in the process of leaving the application.
      onApplicationExit: (Ad ad) => _adMobEventCallback(googleVideoAdEvent.leftApplication),
      // Called when a RewardedAd triggers a reward.
      onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
        _adMobEventCallback(googleVideoAdEvent.rewarded, reward: reward);
      },
    );

    MobileAds.instance.initialize();
    myRewarded = RewardedAd(
      adUnitId: unitId,
      request: AdRequest(),
      listener: listener,
    );
    myRewarded.load();

    _loadAdTimer = Timer.periodic(Duration(minutes: LOAD_AD_TIME_IN_MIN), (Timer t) => loadRewardedVideoAd());
  }

  dispose() {
    myRewarded.dispose();
    _loadAdTimer?.cancel();
  }

  loadRewardedVideoAd() async{
    logger.d("FirebaseAdMobManager loadRewardedVideoAd rewardedVideoAdLoaded: $rewardedVideoAdLoaded");
    if (!rewardedVideoAdLoaded) myRewarded.load();
  }

  showRewardedVideoAd() {
    logger.d("FirebaseAdMobManager showRewardedVideoAd");
    myRewarded.show();
  }
}