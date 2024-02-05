// Copyright (c) 2024 Emanuel Okorafor. All Rights Reserved
// Author: Emmanuel Okorafor








import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task2/homescreen/domain/entity/homescreen_entity.dart';

import '../../../web_core/errors/errors.dart';
import '../../../web_core/use_cases/use_cases.dart';
import '../repository_contracts/homescreen_repository_contracts.dart';




class GetUserBalance extends UseCases<HomeScreenEntity, Parameters> {

  final HomeScreenRepositoryContracts repositoryContracts;

  GetUserBalance(this.repositoryContracts);

  @override
  Future<Either<Errors, HomeScreenEntity>> get(Parameters parameters) async {
    return await repositoryContracts.getUserBalance();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}


class GetUserTransactions extends UseCases<HomeScreenEntity, Parameters> {

  final HomeScreenRepositoryContracts repositoryContracts;

  GetUserTransactions(this.repositoryContracts);

  @override
  Future<Either<Errors, HomeScreenEntity>> get(Parameters parameters) async {
    return await repositoryContracts.getUserTransactions();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}



class SendFund extends UseCases<HomeScreenEntity, Parameters> {

  final HomeScreenRepositoryContracts repositoryContracts;

  SendFund(this.repositoryContracts);

  @override
  Future<Either<Errors, HomeScreenEntity>> get(Parameters parameters) async {
    return await repositoryContracts.sendFund(parameters.recipientAddress, parameters.amount, parameters.currency);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}


class GetTransactionFee extends UseCases<HomeScreenEntity, Parameters> {

  final HomeScreenRepositoryContracts repositoryContracts;

  GetTransactionFee(this.repositoryContracts);

  @override
  Future<Either<Errors, HomeScreenEntity>> get(Parameters parameters) async {
    return await repositoryContracts.getTransactionFee(parameters.recipientAddress, parameters.amount, parameters.currency);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}


class GetExchangeRate extends UseCases<HomeScreenEntity, Parameters> {

  final HomeScreenRepositoryContracts repositoryContracts;

  GetExchangeRate(this.repositoryContracts);

  @override
  Future<Either<Errors, HomeScreenEntity>> get(Parameters parameters) async {
    return await repositoryContracts.getExchangeRate();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}













class Parameters extends Equatable {

  final String? recipientAddress;
  final double? amount;
  final String? currency;


  const Parameters({this.recipientAddress, this.amount, this.currency});


  @override 
  List<Object?> get props => [recipientAddress, amount, currency];

}