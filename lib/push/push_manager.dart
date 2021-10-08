// refer to https://pub.dev/packages/firebase_messaging

import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

import 'package:comecsoft/utils/utils.dart';

enum PushMessageEvent {
  onMessage,
  onLaunch,
  onResume,
  getToken,
}

// It must not be an anonymous function.
// It must be a top-level function (e.g. not a class method which requires initialization).
// NOT USED
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  logger.d("PushMessageManager Handling a background message: ${message.messageId}");
}

class PushMessageManager{
  void Function(PushMessageEvent pushMessageEvent, {Map<String, dynamic>? message, String? pushToken})? _pushCallback;

  void init(Function callback) async{
    _pushCallback = callback as void Function(PushMessageEvent, {Map<String, dynamic>? message, String? pushToken})?;

    await Firebase.initializeApp();

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    // for IOS
    if (Platform.isIOS){
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      logger.d('PushMessageManager User granted permission: ${settings.authorizationStatus}');
    }

    // get token
    _firebaseMessaging.getToken().then((String? pushToken) {
      logger.d("PushMessageManager getToken");
      assert(pushToken != null);

      callback(PushMessageEvent.getToken, pushToken: pushToken);
    });

    // terminated -> open from notification
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      logger.d("PushMessageManager getInitialMessage Got a message whilst in the terminated!");
      logger.d("PushMessageManager getInitialMessage Message data: ${message?.data}");

      if (message != null) callback(PushMessageEvent.onMessage, message: message.data);
    });

    // background --> open from notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      logger.d("PushMessageManager onMessageOpenedApp Got a message whilst in the background!");
      logger.d("PushMessageManager onMessageOpenedApp Message data: ${message.data}");

      if (message.notification != null) {
        logger.d("PushMessageManager Message also contained a notification: ${message.notification}");
      }

      callback(PushMessageEvent.onMessage, message: message.data);
    });

    // foreground --> get push message
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.d("PushMessageManager onMessage Got a message whilst in the foreground!");
      logger.d("PushMessageManager onMessage Message data: ${message.data}");

      if (message.notification != null) {
        logger.d("PushMessageManager Message also contained a notification: ${message.notification}");
      }

      callback(PushMessageEvent.onMessage, message: message.data);
    });

    // NOT USED
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}