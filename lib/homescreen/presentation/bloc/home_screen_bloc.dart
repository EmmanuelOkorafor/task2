// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../web_core/errors/errors.dart';
import '../../domain/entity/homescreen_entity.dart';
import '../../domain/use_cases/homescreen_use_cases.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';




const String NETWORK_ERROR_MESSAGE = 'No network connection at this time. Please connect to a network and try again';
const String SERVER_ERROR_MESSAGE = 'There\'s been a problem connecting to goyerv. Please try again later';




class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {

  final GetUserBalance getUserBalance;
  final GetUserTransactions getUserTransactions;
  final SendFund sendFund;
  final GetTransactionFee getTransactionFee;
  final GetExchangeRate getExchangeRate;




  HomeScreenBloc(this.getUserBalance, this.getUserTransactions, this.sendFund, this.getTransactionFee, this.getExchangeRate) : super(const HomeScreenInitial()) {
    on<HomeScreenEvent>((event, emit) async {
       
      if(event is GetUserBalanceEvent) {
        emit(const HomeScreenLoading());

        final getUserBalanceEither = await getUserBalance.get(const Parameters());

        emit(getUserBalanceEither.fold(
          (l) => Err(mapErrorsToErrorMessage(l)), 
          (r) => HomeScreenLoaded(r)
        ));


      } else 
       if (event is GetUserTransactionsEvent) {
        emit(const HomeScreenLoading());

        final getUserTransactionsEither = await getUserTransactions.get(const Parameters());

        emit(getUserTransactionsEither.fold(
          (l) => Err(mapErrorsToErrorMessage(l)), 
          (r) => HomeScreenLoaded(r)
        ));
       
      
      } else 
      if(event is SendFundEvent) {
        emit(const HomeScreenLoading());

        final sendFundEither = await sendFund.get(Parameters(recipientAddress: event.recipientAddress, amount: event.amount, currency: event.currency));

        emit(sendFundEither.fold(
          (l) => Err(mapErrorsToErrorMessage(l)), 
          (r) => HomeScreenLoaded(r)
        ));

      } else 
      if (event is GetTransactionFeeEvent) {
        emit(const HomeScreenLoading());

        final getTransactionFeeEither = await getTransactionFee.get(Parameters(recipientAddress: event.recipientAddress, amount: event.amount, currency: event.currency));

        emit(getTransactionFeeEither.fold(
          (l) => Err(mapErrorsToErrorMessage(l)), 
          (r) => HomeScreenLoaded(r)
        ));


      } else 
      if (event is GetExchangeRateEvent) {
        emit(const HomeScreenLoading());

        final getExchangeRateEither = await getExchangeRate.get(const Parameters());

        emit(getExchangeRateEither.fold(
          (l) => Err(mapErrorsToErrorMessage(l)), 
          (r) => HomeScreenLoaded(r)
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
