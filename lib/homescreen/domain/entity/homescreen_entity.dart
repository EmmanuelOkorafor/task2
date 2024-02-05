// Copyright (c) 2024 Emanuel Okorafor. All Rights Reserved
// Author: Emmanuel Okorafor








import 'package:equatable/equatable.dart';



class HomeScreenEntity extends Equatable {

  final double? balance;
  final String? currency;
  final int? id;
  final String? toAddress;
  final String? type;
  final double? amount;
  final String? timestamp;
  final String? recipientAddress;
  final List<Map<String, dynamic>>? transactions;


  const HomeScreenEntity({this.balance, this.currency, this.id, this.toAddress, this.type, this.amount, this.timestamp, this.recipientAddress, this.transactions});

  @override
  List<Object?> get props => [balance, currency, id, toAddress, type, amount, timestamp, recipientAddress, transactions];

}