import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSPhoneVrfBloc extends Bloc<FSPhoneVrfEvent, FSPhoneVrfState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSPhoneVrfBloc(FSPhoneVrfState initialState) : super(initialState);

  @override
  Stream<FSPhoneVrfState> mapEventToState(FSPhoneVrfEvent event) async*{
    if (event is FSPhoneVrfRequestCertCode){
      logger.d('${this.runtimeType} FSPhoneVrfRequestCertCode');

      RequestCertCodeResponse? requestCertCodeResponse = await wtbRepository.requestCertCode(event.token, event.phone);

      FSPhoneVrfState? failureState = _getFSPhoneVrfStateFailure(event, requestCertCodeResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSPhoneVrfRequestCertCodeSuccess();
    }else if (event is FSPhoneVrfVerifyCertCodeType1) {
      logger.d('${this.runtimeType} FSPhoneVrfVerifyCertCodeType1');

      VerifyCertCodeResponse? verifyCertCodeResponse = await wtbRepository
          .verifyCertCodeType1(event.token, event.phone, event.code);

      FSPhoneVrfState? failureState = _getFSPhoneVrfStateFailure(
          event, verifyCertCodeResponse);
      if (failureState != null) {
        yield failureState;
        return;
      }

      yield FSPhoneVrfVerifyCertCodeSuccess(
          phone: event.phone.replaceFirst(getDialCode()!, '0'));
    }
  }

  FSPhoneVrfState? _getFSPhoneVrfStateFailure(FSPhoneVrfEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} _getFSPhoneVrfStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSPhoneVrfRequestCertCode) return FSPhoneVrfRequestCertCodeFailure(comment: '');
      if(event is FSPhoneVrfVerifyCertCodeType1) return FSPhoneVrfVerifyCertCodeFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSPhoneVrfRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSPhoneVrfRequestCertCode) return FSPhoneVrfRequestCertCodeFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSPhoneVrfVerifyCertCodeType1) return FSPhoneVrfVerifyCertCodeFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}