import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/accounts/router.dart';
import 'package:comecsoft/flashsale/router.dart';
import 'package:comecsoft/accounts/blocs/providers.dart';
import 'package:comecsoft/flashsale/blocs/providers.dart';
import 'package:comecsoft/accounts/app_state.dart';
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/flashsale/app_factory.dart';
import 'package:comecsoft/accounts/app_factory.dart';
import 'package:comecsoft/common/constants.dart' as constants;


class LbsFaou extends StatefulWidget{
  @override
  _LbsFaouState createState() => _LbsFaouState();
}

class _LbsFaouState extends State<LbsFaou>{
  @override
  Widget build(BuildContext context) {
    dynamic pagesRouteFactories = Map<String, dynamic>()..addAll(ssoPagesRouteFactories)..addAll(whattobuyPagesRouteFactories);
    dynamic blocProviders = ([]..addAll(SSOBlocProvider)..addAll(whattobuyBlocProvider)) as dynamic;
    //dynamic blocProviders = whattobuyBlocProvider;
    dynamic subAppFactories = ssoAppFactories..addAll(gitssoAppFactories);

    // set screen size
    return ScreenUtilInit(
      designSize: Size(constants.DefaultFitWidth, constants.DefaultFitHeight),
      builder: () => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AppState>(create: (_) => AppState(subAppFactories)),
          RepositoryProvider<FSAppState>(create: (_) => FSAppState()),
        ],
        child: MultiBlocProvider(
          providers: [
            for(dynamic provider in blocProviders)
              provider,
          ],
          child: MaterialApp(
            navigatorObservers: [],
            onGenerateRoute: (route){
              return pagesRouteFactories[route.name](route);
            },
            initialRoute: 'splash',
            // use language localization with Flutter Intl plugin.
            // https://plugins.jetbrains.com/plugin/13666-flutter-intl & https://flutter-ko.dev/docs/development/accessibility-and-localization/internationalization
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          ),
        ),
      ),
    );
  }
}