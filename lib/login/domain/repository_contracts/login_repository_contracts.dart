// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:dartz/dartz.dart';
import '../../../web_core/errors/errors.dart';
import '../entities/login_entity.dart';

abstract class LoginRepositoryContracts {
  Future<Either<Errors, LoginEntity>> login(String? username, String? password);
}