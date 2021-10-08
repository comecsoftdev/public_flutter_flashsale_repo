import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:comecsoft/admob/admob_manager.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';

abstract class FSHomeState extends BlocStateBase {
  const FSHomeState();

  @override
  List<Object?> get props => [];
}

class FSHomeInitial extends FSHomeState {
  @override
  String toString() => 'FSHomeInitial';
}

class FSHomeInitDone extends FSHomeState {
  @override
  String toString() => 'FSHomeInitDone';
}

class FSHomeRegisterUserSuccess extends FSHomeState {
  final String token;
  final String refresh;

  FSHomeRegisterUserSuccess({
    required this.token,
    required this.refresh,
  }) :  assert(token != null),
        assert(refresh != null),
        super();

  @override
  List<Object> get props => [token, refresh,];

  @override
  String toString() => 'FSHomeRegisterUserSuccess';
}

class FSHomeRegisterUserFailure extends FSHomeState {
  final String comment;

  FSHomeRegisterUserFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSHomeRegisterUserFailure';
}

class FSHomeLoginRequired extends FSHomeState {

  @override
  String toString() => 'FSHomeLoginRequired';
}

class FSHomeRefreshTokenRequired extends FSHomeState {
  final FSHomeEvent? eventToResend;        // used to authentication error. after refreshing token, re-send this event again.

  const FSHomeRefreshTokenRequired({
    this.eventToResend,
  });

  @override
  List<Object?> get props => [eventToResend];

  @override
  String toString() => 'FSHomeRefreshTokenRequired';
}

class FSHomeGetInitUserDataFailure extends FSHomeState {
  final String comment;

  FSHomeGetInitUserDataFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSHomeGetDataFailure';
}

class FSHomeGetInitUserDataSuccess extends FSHomeState {
  final UserInfo userInfo;
  final AddressBook? addressBook;
  final List<Category>? rootCategories;
  final List<Notice>? notices;
  final FsSettings? fSettings;

  FSHomeGetInitUserDataSuccess({
    required this.userInfo,
    this.addressBook,
    this.rootCategories,
    this.notices,
    this.fSettings,
  }) :  assert(userInfo != null),
        super();

  @override
  List<Object?> get props => [userInfo, addressBook, rootCategories, notices, fSettings];

  @override
  String toString() => 'FSHomeGetInitUserDataSuccess';
}

class FSHomeLocationUpdateDone extends FSHomeState{
  final LatLng position;
  final bool? first;

  FSHomeLocationUpdateDone({
    required this.position,
    this.first,
  }) :  assert(position != null),
        super();

  @override
  List<Object?> get props => [position, first];

  @override
  String toString() => 'FSHomeLocationUpdateDone';
}

class FSHomePeriodicUpdateFailure extends FSHomeState {
  final String comment;

  FSHomePeriodicUpdateFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSHomePeriodicUpdateFailure';
}

class FSHomePeriodicUpdateSuccess extends FSHomeState {
  final List<Posting> posts;
  final LocAddress? address;

  FSHomePeriodicUpdateSuccess({
    required this.posts,
    this.address
  }) :  assert(posts != null),
        super();

  @override
  List<Object?> get props => [posts, address];

  @override
  String toString() => 'FSHomePeriodicUpdateSuccess';
}

class FSHomeRefreshTokenSuccess extends FSHomeState {
  final String token;
  final String? refresh;

  FSHomeRefreshTokenSuccess({
    required this.token,
    this.refresh,
  }) :  assert(token != null),
        assert(token != refresh),
        super();

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'FSHomeRefreshTokenSuccess';
}

class FSHomeRegisterPushTokenSuccess extends FSHomeState {
  final String pushToken;

  FSHomeRegisterPushTokenSuccess({
    required this.pushToken,
  }) :  assert(pushToken != null),
        super();

  @override
  List<Object> get props => [pushToken];

  @override
  String toString() => 'FSHomeRegisterPushTokenSuccess';
}

class FSHomeRegisterPushTokenFailure extends FSHomeState {
  final String comment;

  FSHomeRegisterPushTokenFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSHomeRegisterPushTokenFailure';
}

class FSHomeAdMobEventReceivedState extends FSHomeState{
  final googleVideoAdEvent event;
  final dynamic reward;

  FSHomeAdMobEventReceivedState({
    required this.event,
    required this.reward,
  }) : super();

  @override
  List<Object?> get props => [event, reward];

  @override
  String toString() => 'FSHomeAdMobEventReceivedState';
}

class FSHomeGetMyNoticesSuccess extends FSHomeState {
  final List<Notice>? notices;

  FSHomeGetMyNoticesSuccess({
    this.notices,
  }) :  super();

  @override
  List<Object?> get props => [notices, ];

  @override
  String toString() => 'FSHomeGetMyNoticesSuccess';
}

class FSHomeGetMyNoticesFailure extends FSHomeState {
  final String comment;

  FSHomeGetMyNoticesFailure({
    required this.comment,
  }) : super();

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'FSHomeGetMyNoticesFailure';
}