// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'package:task2/dependency_injections.dart';

Future<void> initSignUp() async {

  // Data Source
  sl.registerLazySingleton<SignUpRemoteDataSource>(() => SignUpRemoteDataSourceImpl());

  // Repository
  sl.registerLazySingleton<SignUpRepositoryContracts>(() => SignUpRepositoryContractsImpl());


  // Use Cases
  sl.registerSingleton<SignUserUp>(SignUserUp(sl()));


  // Bloc
  sl.registerSingleton<SignUpBloc>(SignUpBloc(sl()));


}