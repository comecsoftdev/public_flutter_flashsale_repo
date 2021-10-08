import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';


class FSReportBloc extends Bloc<FSReportEvent, FSReportState>{
  final WhatToBuyRepository wtbRepository = WhatToBuyRepository();

  FSReportBloc(FSReportState initialState) : super(initialState);

  @override
  Stream<FSReportState> mapEventToState(FSReportEvent event) async*{
    if (event is FSReportRegStoreReport){
      logger.d('${this.runtimeType} FSReportRegStoreReport');

      RegisterStoreReportResponse? regStoreReportResponse = await wtbRepository.registerStoreReport(event.token, event.storeId, event.report);

      FSReportState? failureState = _getFSReportStateFailure(event, regStoreReportResponse);
      if (failureState != null){
        yield failureState;
        return;
      }

      yield FSReportRegStoreReportSuccess(id: regStoreReportResponse!.reportId!);
    }
  }

  FSReportState? _getFSReportStateFailure(FSReportEvent event, RegisterStoreReportResponse? response){
    logger.d('${this.runtimeType} _getFSReportStateFailure $event ${response?.statusCode}');

    if(response == null){
      if(event is FSReportRegStoreReport) return FSReportRegStoreReportFailure(comment: '');
    }

    if(response!.statusCode == 401) return FSReportRefreshTokenRequired(eventToResend: event);

    if(response.statusCode != 200){
      if(event is FSReportRegStoreReport) return FSReportRegStoreReportFailure(comment: 'error_code : ${response.statusCode}\n${response.msg}');
    }

    return null;
  }
}