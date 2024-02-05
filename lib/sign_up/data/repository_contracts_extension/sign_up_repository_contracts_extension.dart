// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:dartz/dartz.dart';

import '../../../web_core/errors/errors.dart';
import '../../../web_core/errors/exceptions.dart';
import '../../../web_core/platform/network.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/repository_contracts/sign_up_repository_contracts.dart';
import '../data_sources/remote/sign_up_remote_data_source.dart';
import '../models/sign_up_model.dart';

typedef GetSignUpData = Future<SignUpModel> Function();

class SignUpRepositoryContractsImpl implements SignUpRepositoryContracts {
  

  SignUpRepositoryContractsImpl();

  final SignUpRemoteDataSource remoteDataSource = SignUpRemoteDataSourceImpl();
  final NetworkImpl network = NetworkImpl();



  @override
  Future<Either<Errors, SignUpEntity>> signUserUp(emailAddress, String? password, String? username) async {
    return await _getSignUpData(() => remoteDataSource.signUserUp(emailAddress, password, username));
  }



  Future<Either<Errors, SignUpEntity>> _getSignUpData(GetSignUpData getSignUpData) async {

    if(await network.isConnected) {
      try {
        final remoteSignUpData = await getSignUpData();
        return Right(remoteSignUpData);
      
      } on ServerException {
        return const Left(ServerError());
      
      } 
    
    } else {
      return const Left(NetWorkError());
    
    }
    
  }
  


}