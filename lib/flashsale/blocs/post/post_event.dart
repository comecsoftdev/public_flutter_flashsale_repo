import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/common/constants.dart' as constants;

abstract class FSPostEvent extends BlocEventBase {
  const FSPostEvent();

  @override
  List<Object> get props => [];
}

class FSPostGetPostedStore extends FSPostEvent{
  final String token;
  final int id;
  final int page;                 // comment page number
  final int pageSize;            // comment page size

  FSPostGetPostedStore({
    required this.token,
    required this.id,
    this.page = 1,
    this.pageSize = constants.defaultPageSize,
  }) : super();

  @override
  List<Object> get props => [token, id, page, pageSize];

  @override
  String toString() => 'FSPostGetPostedStore';
}
