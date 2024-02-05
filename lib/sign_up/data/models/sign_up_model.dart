// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor









import '../../domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  const SignUpModel({String? password, String? username, String? emailAddress}) : super(password: password, username: username, emailAddress: emailAddress);

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      password: json['password'],
      username: json['username'],
      emailAddress: json['email'],
    );
  }

}