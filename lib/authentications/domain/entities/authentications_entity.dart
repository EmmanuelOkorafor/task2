// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:equatable/equatable.dart';

class AuthenticationsEntity extends Equatable {

  final bool? loginStateIsPushed;


  const AuthenticationsEntity({this.loginStateIsPushed});

  @override 
  List<Object?> get props => [loginStateIsPushed];

}