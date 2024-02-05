// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2/sign_up/data/repository_contracts_extension/sign_up_repository_contracts_extension.dart';
import 'package:task2/sign_up/domain/repository_contracts/sign_up_repository_contracts.dart';
import 'package:task2/sign_up/presentation/bloc/sign_up_bloc.dart';

import 'authentications/presentation/bloc/authentications_bloc.dart';
import 'homescreen/data/data_sources/remote/homescreen_remote_data_source.dart';
import 'homescreen/data/repository_contracts_extension/homescreen_repository_contracts_extension.dart';
import 'homescreen/domain/repository_contracts/homescreen_repository_contracts.dart';
import 'homescreen/domain/use_cases/homescreen_use_cases.dart';
import 'homescreen/presentation/bloc/home_screen_bloc.dart';
import 'login/data/data_sources/remote/login_remote_data.dart';
import 'login/data/repository_contracts_extensions/login_repository_contracts_extension.dart';
import 'login/domain/repository_contracts/login_repository_contracts.dart';
import 'login/domain/use_cases/login_use_cases.dart';
import 'login/presentation/bloc/login_bloc.dart';
import 'sign_up/data/data_sources/remote/sign_up_remote_data_source.dart';
import 'sign_up/domain/use_cases/sign_up_use_cases.dart';

part 'homescreen/homescreen_dependency_injection.dart';
part 'authentications/authentications_dependency_injection.dart';
part 'sign_up/sign_up_dependency_injection.dart';
part 'login/login_dependency_injection.dart';


final sl = GetIt.instance;


Future<void> init() async {
  await initAuthentications();
  await initHomeScreen();
  await initSignUp();
  await initLogin();
}