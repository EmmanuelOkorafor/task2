// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent({List props = const <dynamic>[]});
}




class Login_Event extends LoginEvent {

  final String? username;
  final String? password;

  const Login_Event(this.username, this.password);

  @override
  List<Object?> get props => [username, password];

}
