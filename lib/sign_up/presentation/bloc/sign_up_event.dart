// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent({List props = const <dynamic>[]});
}




class SignUserUpEvent extends SignUpEvent {
  
  final String? emailAddress;
  final String? password;
  final String? username; 

  const SignUserUpEvent(this.emailAddress, this.password, this.username);

  @override
  List<Object?> get props => [emailAddress, password, username];

}











