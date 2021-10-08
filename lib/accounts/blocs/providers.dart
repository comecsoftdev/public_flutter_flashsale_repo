import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comecsoft/accounts/blocs/blocs.dart';


// ignore: non_constant_identifier_names
List<BlocProvider> SSOBlocProvider = [
  BlocProvider<SSOSignInBloc>(
    create: (BuildContext context) => SSOSignInBloc(SSOSignInInitial()),
  ),
];