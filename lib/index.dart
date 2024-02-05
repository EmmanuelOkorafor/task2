// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/web_core/themes/light/theme_light.dart';

import 'authentications/presentation/states/authentications_state.dart';
import 'dependency_injections.dart';
import 'homescreen/presentation/bloc/home_screen_bloc.dart';

class Task2 extends StatelessWidget {
  const Task2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeScreenBloc>(),
      child: MaterialApp(
        title: 'Pear Monie',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: const Authentications(),
      ),
    );
  }
}
