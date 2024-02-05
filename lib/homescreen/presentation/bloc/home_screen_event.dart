// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent({List props = const <dynamic>[]});
}


class GetUserBalanceEvent extends HomeScreenEvent {

  const GetUserBalanceEvent();

  @override
  List<Object?> get props => [];

}


class GetUserTransactionsEvent extends HomeScreenEvent {

  const GetUserTransactionsEvent();

  @override
  List<Object?> get props => [];

}


class SendFundEvent extends HomeScreenEvent {

  final String? recipientAddress;
  final double? amount;
  final String? currency;

  const SendFundEvent(this.recipientAddress, this.amount, this.currency);

  @override
  List<Object?> get props => [recipientAddress, amount, currency];

}


class GetTransactionFeeEvent extends HomeScreenEvent {

  final String? recipientAddress;
  final double? amount;
  final String? currency;

  const GetTransactionFeeEvent(this.recipientAddress, this.amount, this.currency);

  @override
  List<Object?> get props => [recipientAddress, amount, currency];

}

class GetExchangeRateEvent extends HomeScreenEvent {

  const GetExchangeRateEvent();

  @override
  List<Object?> get props => [];

}