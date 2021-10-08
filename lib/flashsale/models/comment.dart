import 'package:json_annotation/json_annotation.dart';

// Json serialization. https://github.com/dart-lang/json_serializable/tree/master/example

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  int id;
  String email;
  String store;
  String? comment;
  String? created;                   //address or car no
  @JsonKey(defaultValue : false)
  bool? editable;                    //true if user wrote this comment
  @JsonKey(defaultValue : false)
  bool? replyable;                   //true if this comment in manager's store.
  List<Comment>? children;

  Comment({
    required this.id,
    required this.email,
    required this.store,
    required String this.comment,
    required String this.created,
    this.editable,
    this.replyable,
    this.children
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  factory Comment.clone(Comment comment) => Comment(
      id : comment.id,
      email: comment.email,
      store: comment.store,
      comment: comment.comment!,
      created: comment.created!,
      editable: comment.editable,
      replyable: comment.replyable,
      children: comment.children,
  );
}
