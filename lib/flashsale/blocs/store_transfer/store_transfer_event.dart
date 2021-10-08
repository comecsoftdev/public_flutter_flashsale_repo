import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSStoreTransferEvent extends BlocEventBase {
  const FSStoreTransferEvent();

  @override
  List<Object> get props => [];
}

class FSStoreTransferRequestCertCode extends FSStoreTransferEvent{
  final String token;
  final String phone;

  FSStoreTransferRequestCertCode({
    required this.token,
    required this.phone,
  }) : super();

  @override
  List<Object> get props => [token, phone];

  @override
  String toString() => 'FSStoreTransferRequestCertCode';
}

class FSStoreTransferVerifyCertCodeType1 extends FSStoreTransferEvent{
  final String token;
  final String phone;
  final String code;

  FSStoreTransferVerifyCertCodeType1({
    required this.token,
    required this.phone,
    required this.code,
  }) : super();

  @override
  List<Object> get props => [token, phone, code];

  @override
  String toString() => 'FSStoreTransferVerifyCertCodeType1';
}

// transfer store with appToken
class FSStoreTransferAccept extends FSStoreTransferEvent{
  final String token;
  final int storeId;
  final int giverId;
  final String name;
  final String phone;

  FSStoreTransferAccept({
    required this.token,
    required this.storeId,
    required this.giverId,
    required this.name,
    required this.phone,
  }) :  super();

  @override
  List<Object> get props => [token, storeId, giverId, name, phone];

  @override
  String toString() => 'FSStoreTransferAccept';
}

// transfer store with appToken
class FSStoreTransferTransferStore extends FSStoreTransferEvent{
  final String token;
  final String recipient;
  final int storeId;

  FSStoreTransferTransferStore({
    required this.token,
    required this.recipient,
    required this.storeId,
  }) :  super();

  @override
  List<Object> get props => [token, recipient, storeId];

  @override
  String toString() => 'FSStoreTransferTransferStore';
}

class FSStoreTransferTransferStoreSuccess extends FSStoreTransferState {
  final StoreGiver storeGiver;

  FSStoreTransferTransferStoreSuccess({
    required this.storeGiver,
  }) : super();

  @override
  List<Object> get props => [storeGiver, ];

  @override
  String toString() => 'FSStoreTransferTransferStoreSuccess';
}

class FSStoreTransferTransferStoreFailure extends FSStoreTransferState {
  final String comment;

  FSStoreTransferTransferStoreFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSStoreTransferTransferStoreFailure';
}

// transfer store with appToken
class FSStoreTransferTransferReject extends FSStoreTransferEvent{
  final String token;
  final int transferId;

  FSStoreTransferTransferReject({
    required this.token,
    required this.transferId,
  }) :  super();

  @override
  List<Object> get props => [token, transferId, ];

  @override
  String toString() => 'FSStoreTransferTransferReject';
}
