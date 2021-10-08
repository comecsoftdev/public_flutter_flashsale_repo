import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSStoreRegBloc extends Bloc<FSStoreRegEvent, FSStoreRegState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSStoreRegBloc(FSStoreRegState initialState) : super(initialState);

  @override
  Stream<FSStoreRegState> mapEventToState(FSStoreRegEvent event) async*{
    if (event is FSStoreRegRequestCertCode){
      logger.d('${this.runtimeType} FSStoreRegRequestCertCode');

      RequestCertCodeResponse? requestCertCodeResponse = await wtbRepository.requestCertCode(event.token, event.phone);

      FSStoreRegState? failureState = _getFSStoreRegStateFailure(event, requestCertCodeResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreRegRequestCertCodeSuccess();
    }else if (event is FSStoreRegVerifyCertCodeType1){
      logger.d('${this.runtimeType} FSStoreRegVerifyCertCodeType1');

      VerifyCertCodeResponse? verifyCertCodeResponse = await wtbRepository.verifyCertCodeType1(event.token, event.phone, event.code);

      FSStoreRegState? failureState = _getFSStoreRegStateFailure(event, verifyCertCodeResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreRegVerifyCertCodeSuccess(phone: event.phone.replaceFirst(getDialCode()!, '0'));
    }else if (event is FSStoreRegUpdateStore){
      logger.d('${this.runtimeType} FSStoreRegUpdateStore');

      FSStoreRegState? failureState;

      RegUpdateStoreResponse? regUpdateStoreResponse;
      RegUpdateBRCResponse? regUpdateBRCResponse;

      // register or update store & owner
      if ((event.store != null) && (event.owner != null) &&  (event.store!['id'] == null) && event.owner!['id'] == null){
        // register new store
        regUpdateStoreResponse = await wtbRepository.registerStore(event.token, event.owner!, event.store!);
      }else{
        // update store
        regUpdateStoreResponse = await wtbRepository.updateStore(event.token, event.storeId, event.store, event.owner);
      }

      // error check of store & owner
      failureState = _getFSStoreRegStateFailure(event, regUpdateStoreResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      // register or update business registration
      if(event.filePath != null){
        if(event.registrationId == null)
          regUpdateBRCResponse = await wtbRepository.registerBusiness(event.token, event.filePath!, event.storeId!);
        else
          regUpdateBRCResponse = await wtbRepository.updateBusiness(event.token, event.filePath!, event.storeId!, event.registrationId);

        // error check of business registration
        failureState = _getFSStoreRegStateFailure(event, regUpdateBRCResponse);
        if (failureState != null){
          yield failureState;
          return;
        }
      }


      yield FSStoreRegUpdateStoreSuccess(userInfo: regUpdateStoreResponse!.userInfo,
          store: regUpdateStoreResponse.store, storeOwner: regUpdateStoreResponse.storeOwner, registration: regUpdateBRCResponse?.registration);
    }
  }

  FSStoreRegState? _getFSStoreRegStateFailure(FSStoreRegEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} _getFSStoreRegStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSStoreRegRequestCertCode) return FSStoreRegRequestCertCodeFailure(comment: '');
      if(event is FSStoreRegVerifyCertCodeType1) return FSStoreRegVerifyCertCodeFailure(comment: '');
      if(event is FSStoreRegUpdateStore) return FSStoreRegUpdateStoreFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSStoreRegRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSStoreRegRequestCertCode) return FSStoreRegRequestCertCodeFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreRegVerifyCertCodeType1) return FSStoreRegVerifyCertCodeFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreRegUpdateStore) return FSStoreRegUpdateStoreFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}