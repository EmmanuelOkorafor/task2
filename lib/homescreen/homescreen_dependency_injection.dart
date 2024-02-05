// Copyright (c) 2022 Pear Monie. All rights reserved.
// Author: Emmanuel Okorafor







part of 'package:task2/dependency_injections.dart';


Future<void> initHomeScreen() async {

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => HttpClient());
  sl.registerLazySingleton(() => InternetConnectionChecker());


  // DataSources
  sl.registerLazySingleton<HomeScreenRemoteDataSource>(() => HomeScreenRemoteDataSourceImpl());

  // Repository
  sl.registerLazySingleton<HomeScreenRepositoryContracts>(() => HomeScreenRepositoryContractsImpl());

  // UseCases
  sl.registerSingleton<GetUserBalance>(GetUserBalance(sl()));
  sl.registerSingleton<GetUserTransactions>(GetUserTransactions(sl()));
  sl.registerSingleton<SendFund>(SendFund(sl()));
  sl.registerSingleton<GetTransactionFee>(GetTransactionFee(sl()));
  sl.registerSingleton<GetExchangeRate>(GetExchangeRate(sl()));


  // Bloc
  sl.registerSingleton<HomeScreenBloc>(HomeScreenBloc(sl(), sl(), sl(), sl(), sl()));


}

