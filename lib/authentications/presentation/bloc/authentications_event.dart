// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'authentications_bloc.dart';

abstract class AuthenticationsEvent extends Equatable {

  const AuthenticationsEvent();

  @override
  List<Object?> get props => [];

}


class PushLoginStateEvent extends AuthenticationsEvent {

  const PushLoginStateEvent();

  @override
  List<Object> get props => [];
  
}

class PopLoginStateEvent extends AuthenticationsEvent {

  const PopLoginStateEvent();

  @override
  List<Object> get props => [];

}

