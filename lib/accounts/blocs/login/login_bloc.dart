import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/accounts/blocs/blocs.dart';
import 'package:comecsoft/accounts/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class SSOSignInBloc extends Bloc<SSOSignInEvent, SSOSignInState>{
  final SSORepository ssoRepository = SSORepository();

  SSOSignInBloc(SSOSignInState initialState) : super(initialState);

  @override
  Stream<SSOSignInState> mapEventToState(SSOSignInEvent event) async*{
    // Lbsfaou Server SignIn
    if (event is SSOSignInAppServer){
      logger.d('${this.runtimeType} SSOSignInAppServer');
      SignInResponse? signinResponse = await ssoRepository.signinLbsfaouServer(event.email, event.token, event.provider);

      if(signinResponse == null){
        yield SSOSignInNetworkFailure(event: event);
      }else if(signinResponse.statusCode != 200){
        yield SSOSignInFailure(comment: '${signinResponse.statusCode} \n ${signinResponse.msg}');
      }else{
        yield SSOSignInSuccess(token: signinResponse.token, refreshToken: signinResponse.refresh, appToken: signinResponse.appToken,
            user: event.user, provider: event.provider, providerToken: event.token);
      }
    }
  }
}