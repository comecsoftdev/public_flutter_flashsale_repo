import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSStoreTransferBloc extends Bloc<FSStoreTransferEvent, FSStoreTransferState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSStoreTransferBloc(FSStoreTransferState initialState) : super(initialState);

  @override
  Stream<FSStoreTransferState> mapEventToState(FSStoreTransferEvent event) async*{
    if (event is FSStoreTransferRequestCertCode){
      logger.d('${this.runtimeType} FSStoreTransferRequestCertCode');

      RequestCertCodeResponse? requestCertCodeResponse = await wtbRepository.requestCertCode(event.token, event.phone);

      FSStoreTransferState? failureState = _getFSStoreTransferStateFailure(event, requestCertCodeResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreTransferRequestCertCodeSuccess();
    }else if (event is FSStoreTransferVerifyCertCodeType1){
      logger.d('${this.runtimeType} FSStoreTransferVerifyCertCodeType1');

      VerifyCertCodeResponse? verifyCertCodeResponse = await wtbRepository.verifyCertCodeType1(event.token, event.phone, event.code);

      FSStoreTransferState? failureState = _getFSStoreTransferStateFailure(event, verifyCertCodeResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreTransferVerifyCertCodeSuccess(phone: event.phone);
    }else if (event is FSStoreTransferAccept){
      logger.d('${this.runtimeType} FSStoreTransferAccept');

      TransferAcceptResponse? transferAcceptResponse = await wtbRepository.storeAccept(event.token, event.storeId, event.giverId, event.name, event.phone);

      FSStoreTransferState? failureState = _getFSStoreTransferStateFailure(event, transferAcceptResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreTransferAcceptSuccess(userInfo: transferAcceptResponse!.userInfo);
    }else if (event is FSStoreTransferTransferStore){
      logger.d('${this.runtimeType} FSStoreTransferransferStore');

      TransferStoreResponse? storeResponse = await wtbRepository.storeTransfer(event.token, event.recipient, event.storeId);

      FSStoreTransferState? failureState = _getFSStoreTransferStateFailure(event, storeResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreTransferTransferStoreSuccess(storeGiver: storeResponse!.storeGiver!);
    }else if (event is FSStoreTransferTransferReject){
      logger.d('${this.runtimeType} FSStoreTransferTransferReject');

      TransferRejectResponse? transferRejectResponse = await wtbRepository.storeReject(event.token, event.transferId);

      FSStoreTransferState? failureState = _getFSStoreTransferStateFailure(event, transferRejectResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreTransferTransferRejectSuccess(transferId: event.transferId);
    }
  }

  FSStoreTransferState? _getFSStoreTransferStateFailure(FSStoreTransferEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} _getFSStoreTransferStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSStoreTransferAccept) return FSStoreTransferAcceptFailure(comment: '');
      if(event is FSStoreTransferRequestCertCode) return FSStoreTransferRequestCertCodeFailure(comment: '');
      if(event is FSStoreTransferVerifyCertCodeType1) return FSStoreTransferVerifyCertCodeFailure(comment: '');
      if(event is FSStoreTransferTransferStore) return FSStoreTransferTransferStoreFailure(comment: '');
      if(event is FSStoreTransferTransferReject) return FSStoreTransferTransferRejectFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSStoreTransferRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSStoreTransferAccept) return FSStoreTransferAcceptFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreTransferRequestCertCode) return FSStoreTransferRequestCertCodeFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreTransferVerifyCertCodeType1) return FSStoreTransferVerifyCertCodeFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreTransferTransferStore) return FSStoreTransferTransferStoreFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreTransferTransferReject) return FSStoreTransferTransferRejectFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}