import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:comecsoft/admob/admob_manager.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSHomeEvent extends BlocEventBase {
  const FSHomeEvent();

  @override
  List<Object?> get props => [];
}

class FSHomeInit extends FSHomeEvent {}

// register user with appToken
class FSHomeRegisterUser extends FSHomeEvent{
  final String appToken;

  FSHomeRegisterUser({
    required this.appToken,
  }) :  super();

  @override
  List<Object> get props => [appToken, ];

  @override
  String toString() => 'FSHomeRegisterUser';
}

// get current position and initial data
class FSHomeGetInitUserData extends FSHomeEvent{
  final String token;
  final String extra;

  FSHomeGetInitUserData({
    required this.token,
    required this.extra,
  }) :  super();

  @override
  List<Object> get props => [token, extra];

  @override
  String toString() => 'FSHomeGetInitUserData';
}

// get posts Periodically
class FSHomePeriodicUpdate extends FSHomeEvent{
  final String token;
  final LatLng position;
  final SearchingRule searchingRule;

  FSHomePeriodicUpdate({
    required this.token,
    required this.position,
    required this.searchingRule,
  }) :  super();

  @override
  List<Object> get props => [token, position, searchingRule];

  @override
  String toString() => 'FSHomePeriodicUpdate';
}

class FSHomeLocationUpdate extends FSHomeEvent{
  final LatLng position;
  final bool? first;

  FSHomeLocationUpdate({
    required this.position,
    this.first,
  }) :  super();

  @override
  List<Object?> get props => [position, first];

  @override
  String toString() => 'FSHomeLocationUpdate';
}

class FSHomeRefreshToken extends FSHomeEvent{
  final String refresh;
  final String token;

  FSHomeRefreshToken({
    required this.refresh,
    required this.token,
  }) :  super();

  @override
  List<Object> get props => [refresh, token];

  @override
  String toString() => 'FSHomeRefreshToken';
}

class FSHomeRegisterPushToken extends FSHomeEvent{
  final String token;
  final String pushToken;

  FSHomeRegisterPushToken({
    required this.token,
    required this.pushToken,
  }) :  super();

  @override
  List<Object> get props => [token, pushToken];

  @override
  String toString() => 'FSHomeRegisterPushToken';
}

class FSHomeAdMobEventReceived extends FSHomeEvent{
  final googleVideoAdEvent event;
  final dynamic reward;

  FSHomeAdMobEventReceived({
    required this.event,
    required this.reward,
  }) : super();

  @override
  List<Object?> get props => [event, reward];

  @override
  String toString() => 'FSHomeAdMobEventReceived';
}

class FSHomeReadNotice extends FSHomeEvent{
  final String token;
  final String notice;

  FSHomeReadNotice({
    required this.token,
    required this.notice,
  }) :  super();

  @override
  List<Object> get props => [token, notice];

  @override
  String toString() => 'FSHomeReadNotice';
}

class FSHomeGetMyNotices extends FSHomeEvent{
  final String token;

  FSHomeGetMyNotices({
    required this.token,
  }) :  super();

  @override
  List<Object> get props => [token,];

  @override
  String toString() => 'FSHomeGetMyNotices';
}