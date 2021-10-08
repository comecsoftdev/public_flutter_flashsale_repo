import 'package:comecsoft/flashsale/blocs/blocs.dart';

abstract class FSPhoneVrfEvent extends BlocEventBase {
  const FSPhoneVrfEvent();

  @override
  List<Object?> get props => [];
}

class FSPhoneVrfRequestCertCode extends FSPhoneVrfEvent{
  final String token;
  final String phone;

  FSPhoneVrfRequestCertCode({
    required this.token,
    required this.phone,
  }) :  super();

  @override
  List<Object> get props => [token, phone];

  @override
  String toString() => 'FSPhoneVrfRequestCertCode';
}

class FSPhoneVrfVerifyCertCodeType1 extends FSPhoneVrfEvent{
  final String token;
  final String phone;
  final String code;

  FSPhoneVrfVerifyCertCodeType1({
    required this.token,
    required this.phone,
    required this.code,
  }) :  super();

  @override
  List<Object> get props => [token, phone, code];

  @override
  String toString() => 'FSPhoneVrfVerifyCertCodeType1';
}