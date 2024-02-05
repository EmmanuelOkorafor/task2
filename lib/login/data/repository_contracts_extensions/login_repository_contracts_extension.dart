// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:dartz/dartz.dart';

import '../../../../web_core/platform/network.dart';
import '../../../web_core/errors/errors.dart';
import '../../../web_core/errors/exceptions.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repository_contracts/login_repository_contracts.dart';
import '../data_sources/remote/login_remote_data.dart';
import '../models/login_model.dart';

typedef GetLoginData = Future<LoginModel> Function();


class LoginRepositoryImpl implements LoginRepositoryContracts {
  
  
  LoginRepositoryImpl();

  final LoginRemoteDataSource remoteDataSource = LoginRemoteDataSourceImpl();
  final NetworkImpl network = NetworkImpl();


  @override
  Future<Either<Errors, LoginEntity>> login(String? username, String? password) async {
    return await _getLoginData(() => remoteDataSource.login(username, password));
  }





  Future<Either<Errors, LoginEntity>> _getLoginData(GetLoginData getLoginData) async {

    if (await network.isConnected) {
      try {
        final remoteLoginData = await getLoginData();
        return Right(remoteLoginData);
      
      } on ServerException {
        return const Left(ServerError());
      
      } 
    
    } else {
      return const Left(NetWorkError());
    
    }
    
  }
  

    
}