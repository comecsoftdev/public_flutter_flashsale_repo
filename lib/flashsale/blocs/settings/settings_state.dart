import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSSettingsState extends BlocStateBase {
  const FSSettingsState();

  @override
  List<Object?> get props => [];
}

class FSSettingsInitial extends FSSettingsState {
  @override
  String toString() => 'FSSettingsInitial';
}

class FSSettingsRefreshTokenRequired extends FSSettingsState {
  final FSSettingsEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSSettingsRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSSettingsRefreshTokenRequired';
}

class FSSettingsLogOutSuccess extends FSSettingsState {
  FSSettingsLogOutSuccess() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FSSettingsLogOutSuccess';
}

class FSSettingsLogOutFailure extends FSSettingsState {
  final String comment;

  FSSettingsLogOutFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSSettingsLogOutFailure';
}

class FSSettingsDeleteUserSuccess extends FSSettingsState {
  FSSettingsDeleteUserSuccess() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FSSettingsDeleteUserSuccess';
}

class FSSettingsDeleteUserFailure extends FSSettingsState {
  final String comment;

  FSSettingsDeleteUserFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSSettingsDeleteUserFailure';
}

class FSSettingsTransferStoreSuccess extends FSSettingsState {
  final StoreGiver storeGiver;

  FSSettingsTransferStoreSuccess({
    required this.storeGiver,
  }) : super();

  @override
  List<Object> get props => [storeGiver, ];

  @override
  String toString() => 'FSSettingsTransferStoreSuccess';
}

class FSSettingsTransferStoreFailure extends FSSettingsState {
  final String comment;

  FSSettingsTransferStoreFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSSettingsTransferStoreFailure';
}

class FSSettingsTransferCancelSuccess extends FSSettingsState {
  final int transferId;

  FSSettingsTransferCancelSuccess({
    required this.transferId,
  }) : super();

  @override
  List<Object> get props => [transferId, ];

  @override
  String toString() => 'FSSettingsTransferCancelSuccess';
}

class FSSettingsTransferCancelFailure extends FSSettingsState {
  final String comment;

  FSSettingsTransferCancelFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSSettingsTransferCancelFailure';
}

class FSSettingGetSimpleStoreSuccess extends FSSettingsState {
  final Store? store;

  FSSettingGetSimpleStoreSuccess({
    required this.store,
  }) : super();

  @override
  List<Object?> get props => [store, ];

  @override
  String toString() => 'FSSettingGetSimpleStoreSuccess';
}

class FSSettingGetSimpleStoreFailure extends FSSettingsState {
  final String comment;

  FSSettingGetSimpleStoreFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSSettingGetSimpleStoreFailure';
}

class FSSettingGetAddressSuccess extends FSSettingsState {
  final AddressBook? addressBook;

  FSSettingGetAddressSuccess({
    required this.addressBook,
  }) : super();

  @override
  List<Object?> get props => [addressBook, ];

  @override
  String toString() => 'FSSettingGetAddressSuccess';
}

class FSSettingGetAddressFailure extends FSSettingsState {
  final String comment;

  FSSettingGetAddressFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSSettingGetAddressFailure';
}