import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/accounts/repository/repository.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/common/abstract_base.dart';

class FsHomeBloc extends Bloc<FSHomeEvent, FSHomeState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FsHomeBloc(FSHomeState initialState) : super(initialState);

  @override
  Stream<FSHomeState> mapEventToState(FSHomeEvent event) async*{
    if (event is FSHomeInit){
      // register user with AppToken
      yield FSHomeInitDone();
    }else if (event is FSHomeRegisterUser){
      logger.d('${this.runtimeType} FSHomeRegisterUser');

      RegisterUserResponse? registerUserResponse = await wtbRepository.registerUser(event.appToken);

      FSHomeState? failureState = _getFSHomeStateFailure(event, registerUserResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSHomeRegisterUserSuccess(token: registerUserResponse!.token!, refresh: registerUserResponse.refresh!);
    }else if (event is FSHomeGetInitUserData){
      logger.d('${this.runtimeType} FSHomeGetInitUserData $event.searchingRule.mainRule');

      InitUserDataResponse? initUserDataResponse = await wtbRepository.initUserData(event.token, event.extra);

      FSHomeState? failureState = _getFSHomeStateFailure(event, initUserDataResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSHomeGetInitUserDataSuccess(userInfo: initUserDataResponse!.userInfo!,
          addressBook: initUserDataResponse.addressBook, rootCategories: initUserDataResponse.rootCategories!,
          notices: initUserDataResponse.notices, fSettings: initUserDataResponse.fSettings);
    }else if(event is FSHomeLocationUpdate){
      logger.d('${this.runtimeType} FSHomeLocationUpdate: ${event.position}');
      yield FSHomeLocationUpdateDone(position: event.position, first: event.first);
    }else if(event is FSHomePeriodicUpdate){
      logger.d('${this.runtimeType} FSHomePeriodicUpdate $event.searchingRule.mainRule');

      if(event.searchingRule.mainRule == SearchingMaineRule.MyLocationBase){
        GetPostsWithinDistanceResponse? getPostsWithinDistanceResponse = await wtbRepository.getPostsWithinDistance(event.token,
          event.position.latitude.toString(), event.position.longitude.toString(), event.searchingRule.distance.toString());

        FSHomeState? failureState = _getFSHomeStateFailure(event, getPostsWithinDistanceResponse);
        if (failureState != null){
          yield failureState;
          return;
        }

        yield FSHomePeriodicUpdateSuccess(posts: getPostsWithinDistanceResponse!.postings!);
      }else if(event.searchingRule.mainRule == SearchingMaineRule.DistrictBase){
        GetPostsWithinDistrictResponse? getPostsWithinDistrictResponse;
        LocAddress? addressNode;

        getPostsWithinDistrictResponse = await wtbRepository.getPostsWithinDistrict(event.token,
            event.searchingRule.district!.id.toString(), null);
        addressNode = event.searchingRule.district;

        /*
        if (event.searchingRule.district!.coordinates != null && event.searchingRule.district!.center != null){
          logger.d('${this.runtimeType} FSHomePeriodicUpdate district is stored in shared preferences ${event.searchingRule.district!.name}');
          getPostsWithinDistrictResponse = await userRepository.getPostsWithinDistrict(event.token,
              event.searchingRule.district!.id.toString(), null);
          addressNode = event.searchingRule.district;
        }
        else{
          logger.d('${this.runtimeType} FSHomePeriodicUpdate district is NOT stored in shared preferences ${event.searchingRule.district!.name}');
          getPostsWithinDistrictResponse = await userRepository.getPostsWithinDistrict(event.token,
              event.searchingRule.district!.id.toString(), 'coord');
          addressNode = getPostsWithinDistrictResponse?.address;
        }
        */

        FSHomeState? failureState = _getFSHomeStateFailure(event, getPostsWithinDistrictResponse);
        if (failureState != null){
          yield failureState;
          return;
        }

        yield FSHomePeriodicUpdateSuccess(posts: getPostsWithinDistrictResponse!.postings!, address: addressNode);
      }
    }else if(event is FSHomeRefreshToken){
      logger.d('${this.runtimeType} FSHomeRefreshToken');

      RefreshTokenResponse? refreshTokenResponse = await refreshToken(event.refresh, event.token);

      FSHomeState? failureState = _getFSHomeStateFailure(event, refreshTokenResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSHomeRefreshTokenSuccess(token: refreshTokenResponse!.token!,);
    }else if(event is FSHomeRegisterPushToken){
      logger.d('${this.runtimeType} FSHomeRegisterPushToken');

      RegisterPushTokenResponse? registerPushTokenResponse;

      registerPushTokenResponse = await wtbRepository.registerPushToken(event.token, 'android', event.pushToken);

      FSHomeState? failureState = _getFSHomeStateFailure(event, registerPushTokenResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSHomeRegisterPushTokenSuccess(pushToken: event.pushToken);
    }else if(event is FSHomeAdMobEventReceived){
      logger.d('${this.runtimeType} FSHomeAdMobEventReceived');
      yield FSHomeAdMobEventReceivedState(event: event.event, reward: event.reward);
    }else if(event is FSHomeReadNotice){
      logger.d('${this.runtimeType} FSHomeReadNotice');

      await wtbRepository.readNotice(event.token, event.notice);
    }else if(event is FSHomeGetMyNotices){
      logger.d('${this.runtimeType} FSHomeGetMyNotices');

      GetMyNoticesResponse? getMyNoticesResponse;

      getMyNoticesResponse = await wtbRepository.getMyNotices(event.token);

      FSHomeState? failureState = _getFSHomeStateFailure(event, getMyNoticesResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSHomeGetMyNoticesSuccess(notices: getMyNoticesResponse!.notices);
    }
  }

  FSHomeState? _getFSHomeStateFailure(FSHomeEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} _getFSHomeStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSHomeGetInitUserData) return FSHomeGetInitUserDataFailure(comment: '');
      if(event is FSHomePeriodicUpdate) return FSHomePeriodicUpdateFailure(comment: '');
      if(event is FSHomeRefreshToken) return FSHomeLoginRequired();
      if(event is FSHomeRegisterUser) return FSHomeRegisterUserFailure(comment: '');
      if(event is FSHomeRegisterPushToken) return FSHomeRegisterPushTokenFailure(comment: '');
      if(event is FSHomeGetMyNotices) return FSHomeGetMyNoticesFailure(comment: '');
    }

    // HTTP_401_UNAUTHORIZED
    if(response!.statusCode == 401) return FSHomeRefreshTokenRequired(eventToResend: event);

    // HTTP_503_SERVICE_UNAVAILABLE
    if(response.statusCode == 503)
      return FSHomeServiceUnavailable(comment: '${response.msg}');

    if(response.statusCode != 200){
      if(event is FSHomeGetInitUserData) return FSHomeGetInitUserDataFailure(comment: 'error_code : ${response.statusCode} ${response.msg}');
      if(event is FSHomePeriodicUpdate) return FSHomePeriodicUpdateFailure(comment: 'error_code : ${response.statusCode} ${response.msg}');
      if(event is FSHomeRefreshToken) return FSHomeLoginRequired();
      if(event is FSHomeRegisterUser) return FSHomeRegisterUserFailure(comment: 'error_code : ${response.statusCode} ${response.msg}');
      if(event is FSHomeRegisterPushToken) return FSHomeRegisterPushTokenFailure(comment: 'error_code : ${response.statusCode} ${response.msg}');
      if(event is FSHomeGetMyNotices) return FSHomeGetMyNoticesFailure(comment: 'error_code : ${response.statusCode} ${response.msg}');
    }

    return null;
  }
}