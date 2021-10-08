import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSReviewMgmtBloc extends Bloc<FSReviewMgmtEvent, FSReviewMgmtState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSReviewMgmtBloc(FSReviewMgmtState initialState) : super(initialState);

  @override
  Stream<FSReviewMgmtState> mapEventToState(FSReviewMgmtEvent event) async*{
    if (event is FSReviewMgmtInit){
      // init Store page
      yield FSReviewMgmtInitDone();
    }else if (event is FSReviewMgmtRegUpdateReview){
      logger.d('${this.runtimeType} FSReviewMgmtUpdateReview');

      RegUpdateReviewResponse? regUpdateReviewResponse;

      if(event.reviewId == null)
        regUpdateReviewResponse = await wtbRepository.registerReview(event.token, event.storeId, event.parent, event.review, event.rating);
      else
        regUpdateReviewResponse = await wtbRepository.updateReview(event.token, event.storeId, event.reviewId, event.review, event.rating);

      FSReviewMgmtState? failureState = _getFSReviewMgmtStateFailure(event, regUpdateReviewResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSReviewMgmtUpdateReviewSuccess(
        review: regUpdateReviewResponse!.review!, updated: (event.reviewId == null) ? false : true,
      );
    }else if (event is FSReviewMgmtUnRegisterReview){
      logger.d('${this.runtimeType} FSReviewMgmtUnRegisterReview');

      UnRegisterReviewResponse? unRegisterReviewResponse;

      unRegisterReviewResponse = await wtbRepository.unRegisterReview(event.token, event.storeId, event.reviewId);

      FSReviewMgmtState? failureState = _getFSReviewMgmtStateFailure(event, unRegisterReviewResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSReviewMgmtUnRegisterReviewSuccess(reviewId: unRegisterReviewResponse!.reviewId);
    }else if (event is FSReviewMgmtGetReviewsAndUnAnsweredReviews){
      logger.d('${this.runtimeType} FSReviewMgmtGetReviewsAndUnAnsweredReviews');

      GetReviewsAndUnAnsweredReviewsResponse? getReviewsAndUnAnsweredReviewsResponse;

      getReviewsAndUnAnsweredReviewsResponse = await wtbRepository.getReviewsAndUnAnsweredReviews(event.token,
          event.storeId, event.page, event.pageSize, event.base, 'review');

      FSReviewMgmtState? failureState = _getFSReviewMgmtStateFailure(event, getReviewsAndUnAnsweredReviewsResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSReviewMgmtGetReviewsAndUnAnsweredReviewsSuccess(
        reviewInfo: getReviewsAndUnAnsweredReviewsResponse!.reviewInfo, unansweredReviewInfo: getReviewsAndUnAnsweredReviewsResponse.unansweredReviewInfo
      );
    }else if (event is FSReviewMgmtActivateStoreReview){
      logger.d('${this.runtimeType} FSReviewMgmtActivateStoreReview');

      ActivateStoreReviewResponse? activateStoreReviewResponse;

      activateStoreReviewResponse = await wtbRepository.activateStoreReview(event.token, event.storeId, event.enable);

      FSReviewMgmtState? failureState = _getFSReviewMgmtStateFailure(event, activateStoreReviewResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSReviewMgmtActivateStoreReviewSuccess(enable: activateStoreReviewResponse!.enable!);
    }
  }

  FSReviewMgmtState? _getFSReviewMgmtStateFailure(FSReviewMgmtEvent event, RepositoryResponse? response) {
    logger.d(
        '${this.runtimeType} check _getFSReviewMgmtStateFailure $event ${response?.statusCode}');

    if (response == null) {
      if (event is FSReviewMgmtRegUpdateReview)
        return FSReviewMgmtUpdateReviewFailure(comment: '');
      if(event is FSReviewMgmtGetReviewsAndUnAnsweredReviews) return FSReviewMgmtGetReviewsAndUnAnsweredReviewsFailure(comment: '');
      if(event is FSReviewMgmtUnRegisterReview) return FSReviewMgmtUnRegisterReviewFailure(comment: '');
      if(event is FSReviewMgmtActivateStoreReview) return FSReviewMgmtActivateStoreReviewFailure(comment: '');
    }

    if (response!.statusCode == 401)
      return FSReviewMgmtRefreshTokenRequired(eventToResend: event);

    if (response.statusCode != 200) {
      if (event is FSReviewMgmtRegUpdateReview)
        return FSReviewMgmtUpdateReviewFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSReviewMgmtGetReviewsAndUnAnsweredReviews) return FSReviewMgmtGetReviewsAndUnAnsweredReviewsFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSReviewMgmtUnRegisterReview) return FSReviewMgmtUnRegisterReviewFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSReviewMgmtActivateStoreReview) return FSReviewMgmtActivateStoreReviewFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}