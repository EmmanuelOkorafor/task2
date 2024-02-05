// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor
// ignore_for_file: constant_identifier_names






import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


import '../../../web_core/errors/errors.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/use_cases/login_use_cases.dart';

part 'login_event.dart';
part 'login_state.dart';

const String NETWORK_ERROR_MESSAGE = 'No network connection at this time. Please connect to a network and try again';
const String SERVER_ERROR_MESSAGE = 'There\'s been a problem connecting to goyerv. Please try again later';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  final Login login;

  LoginBloc(this.login) : super(const LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      
      if (event is Login_Event) {
        emit(const LoginLoading());

        final loginEither = await login.get(Parameters(username: event.username, password: event.password));
        
        emit(loginEither.fold(
          (l) => Err(mapErrorsToErrorMessage(l)), 
          (r) => LoginLoaded(r),
        ));

      }    
    });
  }

  String? mapErrorsToErrorMessage(Errors errors) {
    switch (errors.runtimeType) {
      case ServerError: 
        return  SERVER_ERROR_MESSAGE;
      case NetWorkError:
        return NETWORK_ERROR_MESSAGE;
      default:
        return null;
    }
  }

}