import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';


List<BlocProvider> whattobuyBlocProvider = [
  // Bloc doesn't emit initial state by default. So send init Event to bloc and bloc emit initial state to listener.
  // https://github.com/felangel/bloc/issues/404.
  BlocProvider<FsHomeBloc>(
    create: (BuildContext context) => FsHomeBloc(FSHomeInitial()),
  ),
  BlocProvider<FsSettingsBloc>(
    create: (BuildContext context) => FsSettingsBloc(FSSettingsInitial()),
  ),
  BlocProvider<FsPostBloc>(
    create: (BuildContext context) => FsPostBloc(FSPostInitial()),
  ),
  BlocProvider<FSStoreBloc>(
    create: (BuildContext context) => FSStoreBloc(FSStoreInitial()),
  ),
  BlocProvider<FSStoreRegBloc>(
    create: (BuildContext context) => FSStoreRegBloc(FSStoreRegInitial()),
  ),
  BlocProvider<FSStoreMgmtBloc>(
    create: (BuildContext context) => FSStoreMgmtBloc(FSStoreMgmtInitial()),
  ),
  BlocProvider<FSProductRegBloc>(
    create: (BuildContext context) => FSProductRegBloc(FSProductRegInitial()),
  ),
  BlocProvider<FSPostRegBloc>(
    create: (BuildContext context) => FSPostRegBloc(FSPostRegInitial()),
  ),
  BlocProvider<FSStoreTransferBloc>(
    create: (BuildContext context) => FSStoreTransferBloc(FSStoreTransferInitial()),
  ),
  BlocProvider<FSReportBloc>(
    create: (BuildContext context) => FSReportBloc(FSReportInitial()),
  ),
  BlocProvider<FSReviewRegBloc>(
    create: (BuildContext context) => FSReviewRegBloc(FSReviewRegInitial()),
  ),
  BlocProvider<FSPhoneVrfBloc>(
    create: (BuildContext context) => FSPhoneVrfBloc(FSPhoneVrfInitial()),
  ),
  BlocProvider<FSProductMgmtBloc>(
    create: (BuildContext context) => FSProductMgmtBloc(FSProductMgmtInitial()),
  ),
  BlocProvider<FSReviewMgmtBloc>(
    create: (BuildContext context) => FSReviewMgmtBloc(FSReviewMgmtInitial()),
  ),
];