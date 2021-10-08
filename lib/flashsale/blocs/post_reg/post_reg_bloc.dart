import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSPostRegBloc extends Bloc<FSPostRegEvent, FSPostRegState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSPostRegBloc(FSPostRegState initialState) : super(initialState);

  @override
  Stream<FSPostRegState> mapEventToState(FSPostRegEvent event) async*{
    if (event is FSPostRegUpdatePost){
      logger.d('${this.runtimeType} FSPostRegUpdateBRC');

      RegUpdatePostResponse? regUpdatePostResponse;

      if(event.post['id'] == null)
        regUpdatePostResponse = await wtbRepository.startPosting(event.token, event.storeId, event.post, event.products);
      else
        regUpdatePostResponse = await wtbRepository.updatePosting(event.token, event.storeId, event.post, event.products);

      FSPostRegState? failureState = _getFSPostRegStateFailure(event, regUpdatePostResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSPostRegUpdatePostSuccess(post: regUpdatePostResponse!.posting, products: event.products);
    }
  }

  FSPostRegState? _getFSPostRegStateFailure(FSPostRegEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} _getFSPostRegStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSPostRegUpdatePost) return FSPostRegUpdatePostFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSPostRegRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSPostRegUpdatePost) return FSPostRegUpdatePostFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}