import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:comecsoft/lbsfaou.dart';
import 'package:comecsoft/utils/utils.dart';

// main function
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // change status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
  ));

  // disable Landscape mode in Flutter
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  setLogLevelDebug();

  runApp(
    LbsFaou(),
  );
}
