// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {

  final String? password;
  final String? emailAddress;
  final String? username; 

  
  const SignUpEntity({this.password, this.emailAddress, this.username});

  @override
  List<Object?> get props => [password, emailAddress, username];

}
