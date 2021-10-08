import 'package:comecsoft/common/constants.dart' as constants;


final Map<dynamic, dynamic> ssoAppFactories ={
  //constants.ssoApp: {'abbr': 'fs', 'loginSilently': (context, provider) => SSOSignInPageState.loginSilently(context, provider)},
  constants.ssoApp: {'abbr': 'sso', 'signin': 'ssosignin'},
};