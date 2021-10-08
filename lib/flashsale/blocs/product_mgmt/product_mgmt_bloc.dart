import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSProductMgmtBloc extends Bloc<FSProductMgmtEvent, FSProductMgmtState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSProductMgmtBloc(FSProductMgmtState initialState) : super(initialState);

  @override
  Stream<FSProductMgmtState> mapEventToState(FSProductMgmtEvent event) async*{
    if (event is FSProductMgmtUnregisterProduct) {
      logger.d('${this.runtimeType} FSProductMgmtUnregisterProduct');

      UnRegisterProductResponse? unRegisterProductResponse = await wtbRepository.unRegisterProduct(event.token, event.storeId, event.productId);

      FSProductMgmtState? failureState = _getFSProductMgmtStateFailure(event, unRegisterProductResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSProductMgmtUnRegisterProductSuccess(productId: unRegisterProductResponse!.productId);
    }
  }

  FSProductMgmtState? _getFSProductMgmtStateFailure(FSProductMgmtEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} check _getFSProductMgmtStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSProductMgmtUnregisterProduct) return FSProductMgmtUnRegisterProductFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSProductMgmtRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSProductMgmtUnregisterProduct) return FSProductMgmtUnRegisterProductFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}