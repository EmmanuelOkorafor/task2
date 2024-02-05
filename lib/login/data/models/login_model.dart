// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({String? username, String? password}) : super(username: username, password: password);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'],
      password: json['password'],
    );

  }

}