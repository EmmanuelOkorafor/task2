// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {

  const LoginState();

  @override 
  List<Object?> get props => [];

}

class LoginInitial extends LoginState {

  const LoginInitial();

  @override 
  List<Object?> get props => [];

}

class LoginLoading extends LoginState {

  const LoginLoading();

  @override 
  List<Object?> get props => [];

}

class LoginLoaded extends LoginState {

  final LoginEntity loginEntity;

  const LoginLoaded(this.loginEntity);

  @override 
  List<Object?> get props => [loginEntity];

}

class Err extends LoginState {

  final String? message;

  const Err(this.message);

  @override 
  List<Object?> get props => [message];

}
