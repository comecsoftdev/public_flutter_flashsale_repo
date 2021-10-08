import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:comecsoft/lbsfaou.dart';
import 'package:comecsoft/utils/utils.dart';

// main function
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
  ));
  setLogLevelDebug();

  runApp(
    LbsFaou(),
  );
}
