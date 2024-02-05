// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor








import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/authentications_entity.dart';

part 'authentications_event.dart';
part 'authentications_state.dart';

class AuthenticationsBloc extends Bloc<AuthenticationsEvent, AuthenticationsState> {
  AuthenticationsBloc() : super(const AuthenticationsInitial()) {
    on<AuthenticationsEvent>((event, emit) async {
      
      if (event is PushLoginStateEvent) {

        emit(const AuthenticationsLoaded(AuthenticationsEntity(loginStateIsPushed: true)));
      
      } else
      if (event is PopLoginStateEvent) {
        emit(const AuthenticationsLoaded(AuthenticationsEntity(loginStateIsPushed: false)));
      
      } 
    });
  }


}
