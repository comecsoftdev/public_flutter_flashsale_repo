abstract class RepositoryResponse{
  final int? statusCode;
  final String? msg;

  RepositoryResponse({this.statusCode, this.msg});
}

abstract class BlocEventBase {
  const BlocEventBase();

  List<Object?> get props;
}

abstract class BlocStateBase {
  const BlocStateBase();

  List<Object?> get props;
}