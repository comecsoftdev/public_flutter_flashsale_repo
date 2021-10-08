import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/common/abstract_base.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSReviewRegBloc extends Bloc<FSReviewRegEvent, FSReviewRegState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSReviewRegBloc(FSReviewRegState initialState) : super(initialState);

  @override
  Stream<FSReviewRegState> mapEventToState(FSReviewRegEvent event) async*{
    if (event is FSReviewRegUpdateReview){
      logger.d('${this.runtimeType} FSReviewRegUpdateReview');

      RegUpdateReviewResponse? regUpdateReviewResponse;

      if(event.reviewId == null)
        regUpdateReviewResponse = await wtbRepository.registerReview(event.token, event.storeId, event.parent, event.review, event.rating);
      else
        regUpdateReviewResponse = await wtbRepository.updateReview(event.token, event.storeId, event.reviewId, event.review, event.rating);

      FSReviewRegState? failureState = _getFSReviewRegStateFailure(event, regUpdateReviewResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSReviewRegUpdateReviewSuccess(
        review: regUpdateReviewResponse!.review!, updated: (event.reviewId == null) ? false : true,
      );
    }
  }

  FSReviewRegState? _getFSReviewRegStateFailure(FSReviewRegEvent event, RepositoryResponse? response) {
    logger.d(
        '${this.runtimeType} check _getFSReviewRegStateFailure $event ${response?.statusCode}');

    if (response == null) {
      if (event is FSReviewRegUpdateReview)
        return FSReviewRegUpdateReviewFailure(comment: '');
    }

    if (response!.statusCode == 401)
      return FSReviewRegRefreshTokenRequired(eventToResend: event);

    if (response.statusCode != 200) {
      if (event is FSReviewRegUpdateReview)
        return FSReviewRegUpdateReviewFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');

    }

    return null;
  }
}