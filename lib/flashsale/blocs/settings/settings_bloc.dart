import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/accounts/repository/repository.dart';
import 'package:comecsoft/accounts/repository/user_response.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/common/abstract_base.dart';

class FsSettingsBloc extends Bloc<FSSettingsEvent, FSSettingsState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FsSettingsBloc(FSSettingsState initialState) : super(initialState);

  @override
  Stream<FSSettingsState> mapEventToState(FSSettingsEvent event) async*{
    if (event is FSSettingSignOut){
      logger.d('${this.runtimeType} FSSettingSignOut');

      SignOutResponse? signOutResponse = await signOut(event.token, event.refresh);

      FSSettingsState? failureState = _getFSSettingsStateFailure(event, signOutResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSSettingsLogOutSuccess();
    }else if (event is FSSettingDeleteUser){
      logger.d('${this.runtimeType} FSSettingDeleteUser');

      DeleteUserResponse? deleteUserResponse = await deleteUser(event.token);

      FSSettingsState? failureState = _getFSSettingsStateFailure(event, deleteUserResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSSettingsDeleteUserSuccess();
    }else if (event is FSSettingTransferStore){
      logger.d('${this.runtimeType} FSSettingTransferStore');

      TransferStoreResponse? storeResponse = await wtbRepository.storeTransfer(event.token, event.recipient, event.storeId);

      FSSettingsState? failureState = _getFSSettingsStateFailure(event, storeResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSSettingsTransferStoreSuccess(storeGiver: storeResponse!.storeGiver!);
    }else if (event is FSSettingTransferCancel){
      logger.d('${this.runtimeType} FSSettingTransferCancel');

      TransferCancelResponse? transferCancelResponse = await wtbRepository.storeCancel(event.token, event.transferId);

      FSSettingsState? failureState = _getFSSettingsStateFailure(event, transferCancelResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSSettingsTransferCancelSuccess(transferId: event.transferId);
    }else if (event is FSSettingGetSimpleStore){
      logger.d('${this.runtimeType} FSSettingGetSimpleStore');

      GetSimpleStoreResponse? getSimpleStoreResponse = await wtbRepository.getSimpleStore(event.token, event.storeId);

      FSSettingsState? failureState = _getFSSettingsStateFailure(event, getSimpleStoreResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSSettingGetSimpleStoreSuccess(store: getSimpleStoreResponse!.store);
    }else if (event is FSSettingGetAddress){
      logger.d('${this.runtimeType} FSSettingGetAddress');

      GetAddressResponse? getAddressResponse = await wtbRepository.getAddress(event.token);

      FSSettingsState? failureState = _getFSSettingsStateFailure(event, getAddressResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSSettingGetAddressSuccess(addressBook: getAddressResponse!.addressBook);
    }
  }

  FSSettingsState? _getFSSettingsStateFailure(FSSettingsEvent event, RepositoryResponse? response){
    logger.d('${this.runtimeType} _getFSSettingsStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSSettingSignOut) return FSSettingsLogOutFailure(comment: '');
      if(event is FSSettingTransferStore) return FSSettingsTransferStoreFailure(comment: '');
      if(event is FSSettingTransferCancel) return FSSettingsTransferCancelFailure(comment: '');
      if(event is FSSettingGetSimpleStore) return FSSettingGetSimpleStoreFailure(comment: '');
      if(event is FSSettingGetAddress) return FSSettingGetAddressFailure(comment: '');
      if(event is FSSettingDeleteUser) return FSSettingsDeleteUserFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSSettingsRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSSettingSignOut) return FSSettingsLogOutFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSSettingTransferStore) return FSSettingsTransferStoreFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSSettingTransferCancel) return FSSettingsTransferCancelFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSSettingGetSimpleStore) return FSSettingGetSimpleStoreFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSSettingGetAddress) return FSSettingGetAddressFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
      if(event is FSSettingDeleteUser) return FSSettingsDeleteUserFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}