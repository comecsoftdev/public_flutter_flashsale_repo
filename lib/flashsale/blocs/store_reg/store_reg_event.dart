import 'package:comecsoft/flashsale/blocs/blocs.dart';

abstract class FSStoreRegEvent extends BlocEventBase {
  const FSStoreRegEvent();

  @override
  List<Object?> get props => [];
}

class FSStoreRegRequestCertCode extends FSStoreRegEvent{
  final String token;
  final String phone;

  FSStoreRegRequestCertCode({
    required this.token,
    required this.phone,
  }) :  super();

  @override
  List<Object> get props => [token, phone];

  @override
  String toString() => 'FSStoreRegRequestCertCode';
}

class FSStoreRegVerifyCertCodeType1 extends FSStoreRegEvent{
  final String token;
  final String phone;
  final String code;

  FSStoreRegVerifyCertCodeType1({
    required this.token,
    required this.phone,
    required this.code,
  }) :  super();

  @override
  List<Object> get props => [token, phone, code];

  @override
  String toString() => 'FSStoreRegVerifyCertCodeType1';
}

class FSStoreRegUpdateStore extends FSStoreRegEvent{
  final String token;
  final int? storeId;
  final Map<String, dynamic >? owner;
  final Map<String, dynamic >? store;
  // update for business registration
  final int? registrationId;
  final String? filePath;


  FSStoreRegUpdateStore({
    required this.token,
    required this.storeId,
    required this.owner,
    required this.store,
    this.registrationId,
    this.filePath,
  }) :  super();

  @override
  List<Object?> get props => [token, storeId, owner, store, registrationId, filePath];

  @override
  String toString() => 'FSStoreRegUpdateStore';
}
