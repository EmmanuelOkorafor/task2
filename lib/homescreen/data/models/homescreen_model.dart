// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor








import '../../domain/entity/homescreen_entity.dart';

class HomeScreenModel extends HomeScreenEntity {
  
  const HomeScreenModel({double? balance, String? currency, int? id, String? toAddress, String? type, double? amount, String? timestamp, String? recipientAddress, List<Map<String, dynamic>>? transactions}) : super(balance: balance, currency: currency, id: id, toAddress: toAddress, type: type, amount: amount, timestamp: timestamp, recipientAddress: recipientAddress, transactions: transactions);

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenModel(balance: json['balance'], currency: json['currency'], id: json['id'], toAddress: json['toAddress'], type: json['type'], amount: json['amount'], timestamp: json['timestamp'], recipientAddress: json['recipientAddress'], transactions: json['transactions']);
  }


}