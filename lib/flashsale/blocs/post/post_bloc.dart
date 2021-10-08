import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FsPostBloc extends Bloc<FSPostEvent, FSPostState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FsPostBloc(FSPostState initialState) : super(initialState);

  @override
  Stream<FSPostState> mapEventToState(FSPostEvent event) async*{
    if (event is FSPostGetPostedStore){
      logger.d('${this.runtimeType} FSGetPostedStore');

      /*
      GetPostedStoreResponse? getPostedStoreResponse = await wtbRepository.getPostedStore(event.token, event.id);

      FSPostState? failureState = _getFSPostStateFailure(event, getPostedStoreResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSPostGetPostedStoreSuccess(store: getPostedStoreResponse!.store!, commentInfo: getPostedStoreResponse.commentInfo,
        myRating: getPostedStoreResponse.myRating, myComment: getPostedStoreResponse.myComment
      );
      */
    }
  }

  FSPostState? _getFSPostStateFailure(FSPostEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} _getFSPostStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSPostGetPostedStore) return FSPostGetPostedStoreFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSPostRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSPostGetPostedStore) return FSPostGetPostedStoreFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}