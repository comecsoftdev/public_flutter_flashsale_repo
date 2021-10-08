import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/common/constants.dart' as constants;

abstract class FSStoreMgmtEvent extends BlocEventBase {
  const FSStoreMgmtEvent();

  @override
  List<Object?> get props => [];
}

class FSStoreMgmtUnregisterProduct extends FSStoreMgmtEvent{
  final String token;
  final int storeId;
  final int productId;

  FSStoreMgmtUnregisterProduct({
    required this.token,
    required this.storeId,
    required this.productId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, productId];

  @override
  String toString() => 'FSStoreMgmtUnregisterProduct';
}

class FSStoreMgmtUnregisterBRC extends FSStoreMgmtEvent{
  final String token;
  final int storeId;
  final int registrationId;

  FSStoreMgmtUnregisterBRC({
    required this.token,
    required this.storeId,
    required this.registrationId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, registrationId];

  @override
  String toString() => 'FSStoreMgmtUnregisterBRC';
}

class FSStoreMgmtUnregisterPost extends FSStoreMgmtEvent{
  final String token;
  final int storeId;

  FSStoreMgmtUnregisterPost({
    required this.token,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, ];

  @override
  String toString() => 'FSStoreMgmtUnregisterPost';
}

class FSStoreMgmtGetPostedStore extends FSStoreMgmtEvent{
  final String token;
  final int id;
  final int page;                 // comment page number
  final int pageSize;            // comment page size

  FSStoreMgmtGetPostedStore({
    required this.token,
    required this.id,
    this.page = 1,
    this.pageSize = constants.defaultPageSize,
  }) : super();

  @override
  List<Object> get props => [token, id, page, pageSize];

  @override
  String toString() => 'FSStoreMgmtGetPostedStore';
}

class FSStoreMgmtGetComments extends FSStoreMgmtEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int? page;
  final int? pageSize;

  FSStoreMgmtGetComments({
    required this.token,
    required this.storeId,
    this.page,
    this.pageSize
  }) : super();

  @override
  List<Object?> get props => [token, storeId, page, pageSize];

  @override
  String toString() => 'FSStoreMgmtGetComments';
}

class FSStoreMgmtRegUpdateComment extends FSStoreMgmtEvent{
  final String token;
  final int? storeId;      //storeID for register comment
  final int? commentId;     //commentID for update comment
  final int? parent;     //parent for reply comment
  final String comment;

  FSStoreMgmtRegUpdateComment({
    required this.token,
    required this.comment,
    this.commentId,
    this.parent,
    this.storeId,
  }) : super();

  @override
  List<Object?> get props => [token, storeId, commentId, parent, comment];

  @override
  String toString() => 'FSStoreMgmtRegUpdateComment';
}

class FSStoreMgmtUnRegisterComment extends FSStoreMgmtEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int commentId;     //commentID for update comment

  FSStoreMgmtUnRegisterComment({
    required this.token,
    required this.commentId,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, commentId, ];

  @override
  String toString() => 'FSStoreMgmtUnRegisterComment';
}

class FSStoreMgmtRegisterReviewReport extends FSStoreMgmtEvent{
  final String token;
  final int storeId;      //storeID for register comment
  final int commentId;     //commentID for update comment

  FSStoreMgmtRegisterReviewReport({
    required this.token,
    required this.commentId,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, commentId];

  @override
  String toString() => 'FSStoreMgmtRegisterCommentReport';
}

class FSStoreMgmtUnregisterStore extends FSStoreMgmtEvent{
  final String token;
  final int storeId;

  FSStoreMgmtUnregisterStore({
    required this.token,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId, ];

  @override
  String toString() => 'FSStoreMgmtUnregisterStore';
}

class FSStoreMgmtGetStoreReport extends FSStoreMgmtEvent{
  final String token;
  final int storeId;

  FSStoreMgmtGetStoreReport({
    required this.token,
    required this.storeId,
  }) : super();

  @override
  List<Object> get props => [token, storeId];

  @override
  String toString() => 'FSStoreMgmtGetStoreReport';
}