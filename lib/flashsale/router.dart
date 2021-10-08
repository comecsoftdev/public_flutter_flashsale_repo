import 'package:comecsoft/flashsale/pages/sample.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import 'package:comecsoft/flashsale/pages/pages.dart';

final whattobuyPagesRouteFactories = {
  "fshome": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSHomePage(key: fsHomePageKey),
    ),
    settings: route,
  ),
  "fsuserintro": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FsUserIntroPage(),
    ),
    settings: route,
  ),
  "fsmanagerintro": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FsManagerIntroPage(),
    ),
    settings: route,
  ),
  "fssettings": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSSettingsPage(key: fsSettingsPageKey, user: route.arguments,),
    ),
    settings: route,
  ),
  /*
  "fspost": (route) => PageTransition(
    child: Center(
      child: FSPostPage(key: fsPostPageKey, posts: route.arguments,),
    ),
    settings: route,
    type: PageTransitionType.fade,
    duration: Duration(milliseconds: 500),
    reverseDuration: Duration(milliseconds: 500),
    alignment: Alignment.bottomCenter
  ),
  */
  "fspost": (route) => MaterialPageRoute(
      builder: (context) => Center(
        child: FSPostPage(key: fsPostPageKey),
      ),
      settings: route,
  ),
  "fssearch": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSSearchPage(key: fsSearchPageKey),
    ),
    settings: route,
  ),
  "fsstore": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSStorePage(key: fsStorePageKey, post: route.arguments['post'], stopPosting: route.arguments['stopPosting'] ?? false,),
    ),
    settings: route,
  ),
  "fsreviewreg": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSReviewRegPage(key: fsReviewRegPageKey, store: route.arguments['store'], review: route.arguments['review']),
    ),
    settings: route,
  ),
  "fslocation": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSLocationPage(key: fsLocationPageKey, latLng: route.arguments['latLng'], locationCheckType: route.arguments['locationCheckType'],),
    ),
    settings: route,
  ),
  "fsstorereg": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSStoreRegPage(key: fsStoreRegPageKey, store: route.arguments['store'], storeOwner: route.arguments['storeOwner'],),
    ),
    settings: route,
  ),
  "fswebview": (route) => PageTransition(
    child: Center(
      child: FSWebViewPage(
        title: route.arguments['title'],
        initialHost: route.arguments['initialHost'],
        initialPath: route.arguments['initialPath'],
        type: route.arguments['type'],
      ),
    ),
    settings: route,
    type: PageTransitionType.rightToLeftWithFade,
    duration: Duration(milliseconds: 300),
    reverseDuration: Duration(milliseconds: 300),
  ),
  "fsnotice": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSNoticePage(notices: route.arguments['notices'],),
    ),
    settings: route,
  ),
  "fsstoremgmt": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSStoreMgmtPage(key: fsStoreMgmtPageKey),
    ),
    settings: route,
  ),
  "fsproductmgmt": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSProductMgmtPage(key: fsProductMgmtPageKey, store: route.arguments['store'],),
    ),
    settings: route,
  ),
//  "fsmypost": (route) => MaterialPageRoute(
//    builder: (context) => Center(
//      child: FSMyPostPage(key: fsMyPostPageKey, store: route.arguments['store'], posting: route.arguments['posting'],
//          extraUserInfo: route.arguments['extraUserInfo'], fsSettings: route.arguments['fsSettings'],),
//    ),
//    settings: route,
//  ),
  "fsreviewmgmt": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSReviewMgmtPage(key: fsReviewMgmtPageKey, store: route.arguments['store'] ),
    ),
    settings: route,
  ),
  "fsproductreg": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSProductRegPage(key: fsProductRegPageKey, store: route.arguments['store'], product: route.arguments['product'],),
    ),
    settings: route,
  ),
  "fspostreg": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSPostRegPage(key: fsPostRegPageKey, store: route.arguments['store'], post: route.arguments['post'],),
    ),
    settings: route,
  ),
  "fsstoretransfer": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSStoreTransferPage(key: fsStoreTransferPageKey,
        store: route.arguments['store'], recipient: route.arguments['recipient'], storeTransferType: route.arguments['type'],),
    ),
    settings: route,
  ),
  "fsreport": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSReportPage(key: fsReportPageKey, arguments: route.arguments),
    ),
    settings: route,
  ),
  "fsimageviewer": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSImageViewerPage(imageProvider: route.arguments['imageProvider'],),
    ),
    settings: route,
  ),
  "fsphonevrf": (route) => PageTransition(
    child: Center(
      child: FSPhoneVrfPage(key: fsPhoneVrfPageKey),
    ),
    settings: route,
    type: PageTransitionType.rightToLeftWithFade,
    duration: Duration(milliseconds: 300),
    reverseDuration: Duration(milliseconds: 300),
  ),
  "fsproductdetail": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FSProductDetailPage(product: route.arguments['product'],),
    ),
    settings: route,
  ),
  "fssample": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: FsSamplePage(),
    ),
    settings: route,
  ),
};