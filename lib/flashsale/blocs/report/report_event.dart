import 'package:comecsoft/flashsale/blocs/blocs.dart';

// registration of store report
abstract class FSReportEvent extends BlocEventBase {
  const FSReportEvent();

  @override
  List<Object> get props => [];
}

class FSReportRegStoreReport extends FSReportEvent{
  final String token;
  final int storeId;
  final int report;

  FSReportRegStoreReport({
    required this.token,
    required this.storeId,
    required this.report,
  }) : super();

  @override
  List<Object> get props => [token, storeId, report];

  @override
  String toString() => 'FSReportRegStoreReport';
}
