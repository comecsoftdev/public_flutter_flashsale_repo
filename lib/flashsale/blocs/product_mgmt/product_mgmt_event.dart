import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/common/constants.dart' as constants;

abstract class FSProductMgmtEvent extends BlocEventBase {
  const FSProductMgmtEvent();

  @override
  List<Object?> get props => [];
}

class FSProductMgmtUnregisterProduct extends FSProductMgmtEvent{
  final String token;
  final int storeId;
  final int productId;

  FSProductMgmtUnregisterProduct({
    required this.token,
    required this.storeId,
    required this.productId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, productId];

  @override
  String toString() => 'FSProductMgmtUnregisterProduct';
}
