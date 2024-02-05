// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'package:task2/dependency_injections.dart';


Future<void> initAuthentications() async {

  // Bloc
  sl.registerSingleton<AuthenticationsBloc>(AuthenticationsBloc());

}