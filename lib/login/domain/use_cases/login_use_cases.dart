// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../web_core/errors/errors.dart';
import '../../../web_core/use_cases/use_cases.dart';
import '../entities/login_entity.dart';
import '../repository_contracts/login_repository_contracts.dart';


class Login extends UseCases<LoginEntity, Parameters>{

  final LoginRepositoryContracts repository;

  Login(this.repository);  

  @override
  Future<Either<Errors, LoginEntity>> get(Parameters parameters) async {
    return await repository.login(parameters.username, parameters.password);
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}






class Parameters extends Equatable {

  final String? username;
  final String? password;
  
  const Parameters({this.username, this.password});

  @override
  List<Object?> get props => [username, password];

}