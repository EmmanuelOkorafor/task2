// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../web_core/errors/errors.dart';
import '../../../web_core/use_cases/use_cases.dart';
import '../entities/sign_up_entity.dart';
import '../repository_contracts/sign_up_repository_contracts.dart';


class SignUserUp extends UseCases<SignUpEntity, Parameters> {

  final SignUpRepositoryContracts repository;

  SignUserUp(this.repository);

  @override
  Future<Either<Errors, SignUpEntity>> get(Parameters parameters) async {
    return await repository.signUserUp(parameters.emailAddress, parameters.password, parameters.username,);
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}





class Parameters extends Equatable {

  final String? password;
  final String? emailAddress;
  final String? username;

  const Parameters({this.password, this.emailAddress, this.username});

  @override
  List<Object?> get props => [password, emailAddress, username];

}