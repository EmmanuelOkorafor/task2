// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'authentications_bloc.dart';

abstract class AuthenticationsState extends Equatable {

  const AuthenticationsState();
  
  @override
  List<Object?> get props => [];

}

class AuthenticationsInitial extends AuthenticationsState {

  const AuthenticationsInitial();
  
  @override
  List<Object?> get props => [];

}

class AuthenticationsLoading extends AuthenticationsState {

  const AuthenticationsLoading();
  
  @override
  List<Object?> get props => [];

}

class AuthenticationsLoaded extends AuthenticationsState {

  final AuthenticationsEntity authenticationsEntity;

  const AuthenticationsLoaded(this.authenticationsEntity);

  @override
  List<Object> get props => [authenticationsEntity];

}