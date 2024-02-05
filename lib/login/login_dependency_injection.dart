// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'package:task2/dependency_injections.dart';


Future<void> initLogin() async {


  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());

 // Repository
  sl.registerLazySingleton<LoginRepositoryContracts>(() => LoginRepositoryImpl());

  // UseCases
  sl.registerSingleton<Login>(Login(sl()));


  // Bloc
  sl.registerSingleton<LoginBloc>(LoginBloc(sl()));



}