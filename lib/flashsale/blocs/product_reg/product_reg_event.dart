import 'package:comecsoft/flashsale/blocs/blocs.dart';

abstract class FSProductRegEvent extends BlocEventBase {
  const FSProductRegEvent();

  @override
  List<Object?> get props => [];
}

class FSProductRegUpdateProduct extends FSProductRegEvent{
  final String token;
  final String? filePath;
  final Map<String, dynamic> product;

  FSProductRegUpdateProduct({
    required this.token,
    required this.filePath,
    required this.product,
  }) :  super();

  @override
  List<Object?> get props => [token, filePath, product];

  @override
  String toString() => 'FSProductRegisterProduct';
}