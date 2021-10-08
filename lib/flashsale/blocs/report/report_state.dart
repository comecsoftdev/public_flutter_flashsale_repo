import 'package:comecsoft/flashsale/blocs/blocs.dart';

abstract class FSReportState extends BlocStateBase {
  const FSReportState();

  @override
  List<Object?> get props => [];
}

class FSReportInitial extends FSReportState {
  @override
  String toString() => 'FSReportInitial';
}

class FSReportRefreshTokenRequired extends FSReportState{
  final FSReportEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSReportRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSReportRefreshTokenRequired';
}


class FSReportRegStoreReportSuccess extends FSReportState {
  final int id;

  FSReportRegStoreReportSuccess({
    required this.id,
  }) : super();

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'FSReportRegStoreReportSuccess';
}

class FSReportRegStoreReportFailure extends FSReportState {
  final String comment;

  FSReportRegStoreReportFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSReportRegStoreReportFailure';
}

