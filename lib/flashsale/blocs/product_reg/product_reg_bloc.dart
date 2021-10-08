import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSProductRegBloc extends Bloc<FSProductRegEvent, FSProductRegState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSProductRegBloc(FSProductRegState initialState) : super(initialState);

  @override
  Stream<FSProductRegState> mapEventToState(FSProductRegEvent event) async*{
    if (event is FSProductRegUpdateProduct){
      logger.d('${this.runtimeType} FSProductRegisterProduct');

      RegUpdateProductResponse? regUpdateProductResponse;

      if(event.product['id'] == null)
        regUpdateProductResponse = await wtbRepository.registerProduct(event.token, event.filePath!, event.product);
      else
        regUpdateProductResponse = await wtbRepository.updateProduct(event.token, event.filePath, event.product);

      FSProductRegState? failureState = _getFSProductRegStateFailure(event, regUpdateProductResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSProductRegUpdateProductSuccess(product: regUpdateProductResponse!.product);
    }
  }

  FSProductRegState? _getFSProductRegStateFailure(FSProductRegEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} _getFSProductRegStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSProductRegUpdateProduct) return FSProductRegUpdateProductFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSProductRegRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSProductRegUpdateProduct) return FSProductRegUpdateProductFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}