// Copyright (c) 2024 Emanuel Okorafor. All Rights Reserved
// Author: Emmanuel Okorafor







import 'package:dartz/dartz.dart';

import '../../../web_core/errors/errors.dart';
import '../entity/homescreen_entity.dart';

abstract class HomeScreenRepositoryContracts {
  Future<Either<Errors, HomeScreenEntity>> getUserBalance();
  Future<Either<Errors, HomeScreenEntity>> getUserTransactions();
  Future<Either<Errors, HomeScreenEntity>> sendFund(String? recipientAddress, double? amount,  String? currency);
  Future<Either<Errors, HomeScreenEntity>> getTransactionFee(String? recipientAddress, double? amount,  String? currency);
  Future<Either<Errors, HomeScreenEntity>> getExchangeRate();
}