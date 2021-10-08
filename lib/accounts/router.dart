import 'package:flutter/material.dart';

import 'package:comecsoft/accounts/pages/pages.dart';

final ssoPagesRouteFactories = {
  "ssosignin": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: SSOSignInPage(),
    ),
    settings: route,
  ),
  "splash": (route) => MaterialPageRoute(
    builder: (context) => Center(
      child: SplashPage(),
    ),
    settings: route,
  ),
};