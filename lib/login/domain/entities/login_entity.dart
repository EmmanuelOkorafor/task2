// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {

  final String? username;
  final String? password;

  const LoginEntity({this.username, this.password});

  @override
  List<Object?> get props => [username, password];
  
}