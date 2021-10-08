import 'package:comecsoft/flashsale/blocs/blocs.dart';

// registration of business registration certificate(BRC)
abstract class FSPostRegEvent extends BlocEventBase {
  const FSPostRegEvent();

  @override
  List<Object> get props => [];
}

class FSPostRegUpdatePost extends FSPostRegEvent{
  final String token;
  final int storeId;
  final Map<String, dynamic> post;
  final List<int> products;

  FSPostRegUpdatePost({
    required this.token,
    required this.storeId,
    required this.post,
    required this.products,
  }) :  super();

  @override
  List<Object> get props => [token, storeId, post, products];

  @override
  String toString() => 'FSPostRegUpdatePost';
}
