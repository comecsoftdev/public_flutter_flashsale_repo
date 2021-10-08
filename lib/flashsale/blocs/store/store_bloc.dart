import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSStoreBloc extends Bloc<FSStoreEvent, FSStoreState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSStoreBloc(FSStoreState initialState) : super(initialState);

  @override
  Stream<FSStoreState> mapEventToState(FSStoreEvent event) async*{
    if (event is FSStoreInit){
      // init Store page
      yield FSStoreInitDone();
    }else if (event is FSStoreGetPostedStore){
      logger.d('${this.runtimeType} FSStoreGetPostedStore');

      GetPostedStoreResponse? getPostedStoreResponse = await wtbRepository.getPostedStore(event.token, event.storeId);

      FSStoreState? failureState = _getFSStoreStateFailure(event, getPostedStoreResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreGetPostedStoreSuccess(store: getPostedStoreResponse!.store!, reviewInfo: getPostedStoreResponse.reviewInfo,
          myReview: getPostedStoreResponse.myReview
      );
    }else if (event is FSStoreRegUpdateRating){
      logger.d('${this.runtimeType} FSStoreRegUpdateRating');

      RegUpdateRatingResponse? regUpdateRatingResponse;

      if(event.ratingId == null)
        regUpdateRatingResponse = await wtbRepository.registerRating(event.token, event.storeId, event.rating);
      else
        regUpdateRatingResponse = await wtbRepository.updateRating(event.token, event.storeId, event.ratingId, event.rating);

      FSStoreState? failureState = _getFSStoreStateFailure(event, regUpdateRatingResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreRegUpdateRatingSuccess(
        ratingId: regUpdateRatingResponse!.ratingId!, rating: event.rating, updated: (event.ratingId == null) ? false : true,
      );
    }else if (event is FSStoreRegUpdateComment){
      logger.d('${this.runtimeType} FSStoreRegUpdateComment');

      RegUpdateCommentResponse? regUpdateCommentResponse;

      if(event.commentId == null)
        regUpdateCommentResponse = await wtbRepository.registerComment(event.token, event.storeId, event.parent, event.comment);
      else
        regUpdateCommentResponse = await wtbRepository.updateComment(event.token, event.storeId, event.commentId, event.comment);

      FSStoreState? failureState = _getFSStoreStateFailure(event, regUpdateCommentResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreRegUpdateCommentSuccess(
        comment: regUpdateCommentResponse!.comment!, updated: (event.commentId == null) ? false : true,
      );
    }else if (event is FSStoreUnRegisterComment){
      logger.d('${this.runtimeType} FSStoreUnRegisterComment');

      UnRegisterCommentResponse? unRegisterCommentResponse;

      unRegisterCommentResponse = await wtbRepository.unRegisterComment(event.token, event.storeId, event.commentId);

      FSStoreState? failureState = _getFSStoreStateFailure(event, unRegisterCommentResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreUnRegisterCommentSuccess(commentId: unRegisterCommentResponse!.commentId);
    }else if (event is FSStoreUnRegisterReview){
      logger.d('${this.runtimeType} FSStoreUnRegisterReview');

      UnRegisterReviewResponse? unRegisterReviewResponse;

      unRegisterReviewResponse = await wtbRepository.unRegisterReview(event.token, event.storeId, event.reviewId);

      FSStoreState? failureState = _getFSStoreStateFailure(event, unRegisterReviewResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreUnRegisterReviewSuccess(reviewId: unRegisterReviewResponse!.reviewId);
    }else if (event is FSStoreRegisterReviewReport){
      logger.d('${this.runtimeType} FSStoreRegisterReviewReport');

      RegisterReviewReportResponse? registerReviewReportResponse;

      registerReviewReportResponse = await wtbRepository.registerReviewReport(event.token, event.storeId, event.reviewId);

      FSStoreState? failureState = _getFSStoreStateFailure(event, registerReviewReportResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreRegisterReviewReportSuccess(reportId: registerReviewReportResponse!.reportId);
    }else if (event is FSStoreGetReviews){
      logger.d('${this.runtimeType} FSStoreGetReviews');

      GetReviewsResponse? getReviewsResponse;

      getReviewsResponse = await wtbRepository.getReviews(event.token, event.storeId, event.page, event.pageSize, event.base);

      FSStoreState? failureState = _getFSStoreStateFailure(event, getReviewsResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreGetReviewsSuccess(reviewInfo: getReviewsResponse!.reviewInfo);
    }else if (event is FSStoreUnregisterPost) {
      logger.d('${this.runtimeType} FSStoreUnregisterPost');

      UnRegisterPostResponse? unRegisterPostResponse = await wtbRepository.stopPosting(event.token, event.storeId);

      FSStoreState? failureState = _getFSStoreStateFailure(event, unRegisterPostResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSStoreUnRegisterPostSuccess(storeId: unRegisterPostResponse!.storeId, extraUserInfo: unRegisterPostResponse.extraUserInfo);
    }
  }

  FSStoreState? _getFSStoreStateFailure(FSStoreEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} check _getFSStoreStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSStoreGetPostedStore) return FSStoreGetPostedStoreFailure(comment: '');
      if(event is FSStoreRegUpdateRating) return FSStoreRegUpdateRatingFailure(comment: '');
      if(event is FSStoreRegUpdateComment) return FSStoreRegUpdateCommentFailure(comment: '');
      if(event is FSStoreUnRegisterComment) return FSStoreUnRegisterCommentFailure(comment: '');
      if(event is FSStoreUnRegisterReview) return FSStoreUnRegisterReviewFailure(comment: '');
      if(event is FSStoreRegisterReviewReport) return FSStoreRegisterReviewReportFailure(comment: '');
      if(event is FSStoreGetReviews) return FSStoreGetReviewsFailure(comment: '');
      if(event is FSStoreUnregisterPost) return FSStoreUnRegisterPostFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSStoreRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSStoreGetPostedStore) return FSStoreGetPostedStoreFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreRegUpdateRating) return FSStoreRegUpdateRatingFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreRegUpdateComment) return FSStoreRegUpdateCommentFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreUnRegisterComment) return FSStoreUnRegisterCommentFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreUnRegisterReview) return FSStoreUnRegisterReviewFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreRegisterReviewReport) return FSStoreRegisterReviewReportFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreGetReviews) return FSStoreGetReviewsFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSStoreUnregisterPost) return FSStoreUnRegisterPostFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}