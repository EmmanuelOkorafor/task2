// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:dartz/dartz.dart';

import '../../../web_core/errors/errors.dart';
import '../entities/sign_up_entity.dart';

abstract class SignUpRepositoryContracts {
  Future<Either<Errors, SignUpEntity>> signUserUp(emailAddress, String? password, String? username,);
}