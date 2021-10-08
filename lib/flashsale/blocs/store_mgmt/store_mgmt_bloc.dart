import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSStoreMgmtBloc extends Bloc<FSStoreMgmtEvent, FSStoreMgmtState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSStoreMgmtBloc(FSStoreMgmtState initialState) : super(initialState);

  @override
  Stream<FSStoreMgmtState> mapEventToState(FSStoreMgmtEvent event) async*{
    if (event is FSStoreMgmtUnregisterProduct) {
      logger.d('${this.runtimeType} FSStoreMgmtUnregisterProduct');

      UnRegisterProductResponse? unRegisterProductResponse = await wtbRepository.unRegisterProduct(event.token, event.storeId, event.productId);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, unRegisterProductResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreMgmtUnRegisterProductSuccess(productId: unRegisterProductResponse!.productId);
    }else if (event is FSStoreMgmtUnregisterBRC) {
      logger.d('${this.runtimeType} FSStoreMgmtUnregisterBRC');

      UnRegisterBRCResponse? unRegisterBRCResponse = await wtbRepository.unRegisterBusiness(event.token, event.storeId, event.registrationId);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, unRegisterBRCResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreMgmtUnRegisterBRCSuccess(registrationId: unRegisterBRCResponse!.registrationId);
    }else if (event is FSStoreMgmtUnregisterPost) {
      logger.d('${this.runtimeType} FSStoreMgmtUnregisterPost');

      UnRegisterPostResponse? unRegisterPostResponse = await wtbRepository.stopPosting(event.token, event.storeId);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, unRegisterPostResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreMgmtUnRegisterPostSuccess(storeId: unRegisterPostResponse!.storeId, extraUserInfo: unRegisterPostResponse.extraUserInfo);
    }else if (event is FSStoreMgmtGetPostedStore){
      logger.d('${this.runtimeType} FSStoreMgmtGetPostedStore');

      GetPostedStoreResponse? getPostedStoreResponse = await wtbRepository.getPostedStore(event.token, event.id);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, getPostedStoreResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      // yield FSStoreMgmtGetPostedStoreSuccess(store: getPostedStoreResponse!.store!, commentInfo: getPostedStoreResponse.commentInfo,
      //     myRating: getPostedStoreResponse.myRating, myComment: getPostedStoreResponse.myComment
      // );
    }else if (event is FSStoreMgmtGetComments){
      logger.d('${this.runtimeType} FSStoreMgmtGetComments');

      GetReviewsResponse? getReviewsResponse;

      //getCommentsResponse = await wtbRepository.getReviews(event.token, event.storeId, event.page, event.pageSize, event);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, getReviewsResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      //yield FSStoreMgmtGetCommentsSuccess(commentInfo: getCommentsResponse!.commentInfo);
    }else if (event is FSStoreMgmtRegUpdateComment){
      logger.d('${this.runtimeType} FSStoreMgmtRegUpdateComment');

      RegUpdateCommentResponse? regUpdateCommentResponse;

      if(event.commentId == null)
        regUpdateCommentResponse = await wtbRepository.registerComment(event.token, event.storeId, event.parent, event.comment);
      else
        regUpdateCommentResponse = await wtbRepository.updateComment(event.token, event.storeId, event.commentId, event.comment);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, regUpdateCommentResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreMgmtRegUpdateCommentSuccess(
        comment: regUpdateCommentResponse!.comment!, updated: (event.commentId == null) ? false : true, parent: event.parent
      );
    }else if (event is FSStoreMgmtUnRegisterComment){
      logger.d('${this.runtimeType} FSStoreMgmtUnRegisterComment');

      UnRegisterCommentResponse? unRegisterCommentResponse;

      unRegisterCommentResponse = await wtbRepository.unRegisterComment(event.token, event.storeId, event.commentId);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, unRegisterCommentResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreMgmtUnRegisterCommentSuccess(commentId: unRegisterCommentResponse!.commentId,);
    }else if (event is FSStoreMgmtRegisterReviewReport){
      logger.d('${this.runtimeType} FSStoreMgmtRegisterCommentReport');

      RegisterReviewReportResponse? registerReviewReportResponse;

      registerReviewReportResponse = await wtbRepository.registerReviewReport(event.token, event.storeId, event.commentId);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, registerReviewReportResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreMgmtRegisterReviewReportSuccess(reportId: registerReviewReportResponse!.reportId);
    }else if (event is FSStoreMgmtUnregisterStore) {
      logger.d('${this.runtimeType} FSStoreMgmtUnregisterStore');

      UnRegisterStoreResponse? unRegisterStoreResponse = await wtbRepository.unregisterStore(event.token, event.storeId,);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, unRegisterStoreResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreMgmtUnRegisterStoreSuccess(storeId: event.storeId);
    }else if (event is FSStoreMgmtGetStoreReport) {
      logger.d('${this.runtimeType} FSStoreMgmtGetStoreReport');

      GetStoreReportResponse? getStoreReportResponse = await wtbRepository.getStoreReport(event.token, event.storeId,);

      FSStoreMgmtState? failureState = _getFSStoreMgmtStateFailure(event, getStoreReportResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreMgmtGetStoreReportSuccess(storeReport: getStoreReportResponse!.storeReport!);
    }
  }

  FSStoreMgmtState? _getFSStoreMgmtStateFailure(FSStoreMgmtEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} check _getStoreMgmtStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSStoreMgmtUnregisterProduct) return FSStoreMgmtUnRegisterProductFailure(comment: '');
      if(event is FSStoreMgmtUnregisterBRC) return FSStoreMgmtUnRegisterBRCFailure(comment: '');
      if(event is FSStoreMgmtUnregisterPost) return FSStoreMgmtUnRegisterPostFailure(comment: '');
      if(event is FSStoreMgmtGetPostedStore) return FSStoreMgmtGetPostedStoreFailure(comment: '');
      if(event is FSStoreMgmtGetComments) return FSStoreMgmtGetCommentsFailure(comment: '');
      if(event is FSStoreMgmtRegUpdateComment) return FSStoreMgmtRegUpdateCommentFailure(comment: '');
      if(event is FSStoreMgmtUnRegisterComment) return FSStoreMgmtUnRegisterCommentFailure(comment: '');
      if(event is FSStoreMgmtRegisterReviewReport) return FSStoreMgmtRegisterReviewReportFailure(comment: '');
      if(event is FSStoreMgmtUnregisterStore) return FSStoreMgmtUnRegisterStoreFailure(comment: '');
      if(event is FSStoreMgmtGetStoreReport) return FSStoreMgmtGetStoreReportFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSStoreMgmtRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSStoreMgmtUnregisterProduct) return FSStoreMgmtUnRegisterProductFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtUnregisterBRC) return FSStoreMgmtUnRegisterBRCFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtUnregisterPost) return FSStoreMgmtUnRegisterPostFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtGetPostedStore) return FSStoreMgmtGetPostedStoreFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtGetComments) return FSStoreMgmtGetCommentsFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtRegUpdateComment) return FSStoreMgmtRegUpdateCommentFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtUnRegisterComment) return FSStoreMgmtUnRegisterCommentFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtRegisterReviewReport) return FSStoreMgmtRegisterReviewReportFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtUnregisterStore) return FSStoreMgmtUnRegisterStoreFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreMgmtGetStoreReport) return FSStoreMgmtGetStoreReportFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}