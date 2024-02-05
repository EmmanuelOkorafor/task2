// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:dartz/dartz.dart';

import '../../../web_core/errors/errors.dart';
import '../../../web_core/errors/exceptions.dart';
import '../../../web_core/platform/network.dart';
import '../../domain/entity/homescreen_entity.dart';
import '../../domain/repository_contracts/homescreen_repository_contracts.dart';
import '../data_sources/remote/homescreen_remote_data_source.dart';
import '../models/homescreen_model.dart';

typedef GetHomeScreenData = Future<HomeScreenModel> Function();


class HomeScreenRepositoryContractsImpl implements HomeScreenRepositoryContracts {

  HomeScreenRepositoryContractsImpl();

  final HomeScreenRemoteDataSource remoteDataSource = HomeScreenRemoteDataSourceImpl();
  final NetworkImpl network = NetworkImpl();
  
  @override
  Future<Either<Errors, HomeScreenEntity>> getExchangeRate() async {
     return await _getHomeScreenData(() => remoteDataSource.getExchangeRate());
  }
  
  @override
  Future<Either<Errors, HomeScreenEntity>> getTransactionFee(String? recipientAddress, double? amount, String? currency) async {
     return await _getHomeScreenData(() => remoteDataSource.getTransactionFee(recipientAddress, amount, currency));

  }
  
  @override
  Future<Either<Errors, HomeScreenEntity>> getUserBalance() async {
    return await _getHomeScreenData(() => remoteDataSource.getUserBalance());
  }
  
  @override
  Future<Either<Errors, HomeScreenEntity>> getUserTransactions() async {
    return await _getHomeScreenData(() => remoteDataSource.getUserTransactions());
  }
  
  @override
  Future<Either<Errors, HomeScreenEntity>> sendFund(String? recipientAddress, double? amount, String? currency) async {
    return await _getHomeScreenData(() => remoteDataSource.sendFund(recipientAddress, amount, currency));

  }











  Future<Either<Errors, HomeScreenEntity>> _getHomeScreenData(GetHomeScreenData getHomeScreenData) async {

    if (await network.isConnected) {
      try {
        final remoteHomeScreenData = await getHomeScreenData();
        return Right(remoteHomeScreenData);

      } on ServerException {
        throw Error();
      
      }
    } else {
      throw Error();
    
    }
  } 

}