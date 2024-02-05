// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../web_core/errors/errors.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/use_cases/sign_up_use_cases.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';


const String NETWORK_ERROR_MESSAGE = 'No network connection at this time. Please connect to a network and try again';
const String SERVER_ERROR_MESSAGE = 'There\'s been a problem connecting to goyerv. Please try again later';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {


  final SignUserUp signUserUp;
  
  SignUpBloc(this.signUserUp,) : super(const SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      
      if (event is SignUserUpEvent) {
        emit(const SignUpLoading());


        final signUserUpEither = await signUserUp.get(Parameters(emailAddress: event.emailAddress, password: event.password, username: event.username,));

        emit(signUserUpEither.fold(
          (l) => Err(mapErrorsToErrorMessage(l)), 
          (r) => SignUpLoaded(r),
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
