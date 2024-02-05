// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {

  const SignUpState();
  
  @override
  List<Object?> get props => [];
  
}

class SignUpInitial extends SignUpState {

  const SignUpInitial();
  
  @override
  List<Object?> get props => [];

}

class SignUpLoading extends SignUpState {

  const SignUpLoading();
  
  @override
  List<Object?> get props => [];

}

class SignUpLoaded extends SignUpState {

  final SignUpEntity signUpEntity;

  const SignUpLoaded(this.signUpEntity);

  @override 
  List<Object?> get props => [signUpEntity];

}

class Err extends SignUpState {

  final String? message;

  const Err(this.message);

  @override 
  List<Object?> get props => [message];
  
}