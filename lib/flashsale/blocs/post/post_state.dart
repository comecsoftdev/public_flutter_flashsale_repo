import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSPostState extends BlocStateBase {
  const FSPostState();

  @override
  List<Object?> get props => [];
}

class FSPostInitial extends FSPostState {
  @override
  String toString() => 'FSPostInitial';
}

class FSPostRefreshTokenRequired extends FSPostState {
  final FSPostEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSPostRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSPostRefreshTokenRequired';
}

class FSPostGetPostedStoreSuccess extends FSPostState {
  final Store store;
  final CommentInfo? commentInfo;
  final Rating? myRating;
  final Comment? myComment;

  FSPostGetPostedStoreSuccess({
    required this.store,
    required this.commentInfo,
    this.myRating,
    this.myComment
  }) : super();

  @override
  List<Object?> get props => [store, commentInfo];

  @override
  String toString() => 'FSPostGetPostedStoreSuccess';
}

class FSPostGetPostedStoreFailure extends FSPostState {
  final String comment;

  FSPostGetPostedStoreFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSPostGetPostedStoreFailure';
}