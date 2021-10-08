import 'package:comecsoft/flashsale/blocs/blocs.dart';

abstract class FSSettingsEvent extends BlocEventBase {
  const FSSettingsEvent();

  @override
  List<Object> get props => [];
}

// register user with appToken
class FSSettingSignOut extends FSSettingsEvent{
  final String token;
  final String refresh;

  FSSettingSignOut({
    required this.token,
    required this.refresh,
  }) :  super();

  @override
  List<Object> get props => [token, ];

  @override
  String toString() => 'FSSettingLogOut';
}

// delete user
class FSSettingDeleteUser extends FSSettingsEvent{
  final String token;

  FSSettingDeleteUser({
    required this.token,
  }) :  super();

  @override
  List<Object> get props => [token, ];

  @override
  String toString() => 'FSSettingDeleteUser';
}

// transfer store with appToken
class FSSettingTransferStore extends FSSettingsEvent{
  final String token;
  final String recipient;
  final int storeId;

  FSSettingTransferStore({
    required this.token,
    required this.recipient,
    required this.storeId,
  }) :  super();

  @override
  List<Object> get props => [token, recipient, storeId];

  @override
  String toString() => 'FSSettingTransferStore';
}

// transfer store with appToken
class FSSettingTransferCancel extends FSSettingsEvent{
  final String token;
  final int transferId;

  FSSettingTransferCancel({
    required this.token,
    required this.transferId,
  }) :  super();

  @override
  List<Object> get props => [token, transferId, ];

  @override
  String toString() => 'FSSettingTransferCancel';
}

class FSSettingGetSimpleStore extends FSSettingsEvent{
  final String token;
  final int storeId;

  FSSettingGetSimpleStore({
    required this.token,
    required this.storeId,
  }) :  super();

  @override
  List<Object> get props => [token, storeId, ];

  @override
  String toString() => 'FSSettingGetSimpleStore';
}

class FSSettingGetAddress extends FSSettingsEvent{
  final String token;

  FSSettingGetAddress({
    required this.token,
  }) :  super();

  @override
  List<Object> get props => [token, ];

  @override
  String toString() => 'FSSettingGetAddress';
}
