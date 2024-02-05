// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;


import '../../../../web_core/errors/exceptions.dart';
import '../../models/homescreen_model.dart';

abstract class HomeScreenRemoteDataSource {
  Future<HomeScreenModel> getUserBalance();
  Future<HomeScreenModel> getUserTransactions();
  Future<HomeScreenModel> sendFund(String? recipientAddress, double? amount,  String? currency);
  Future<HomeScreenModel> getTransactionFee(String? recipientAddress, double? amount,  String? currency);
  Future<HomeScreenModel> getExchangeRate();
}



class HomeScreenRemoteDataSourceImpl implements HomeScreenRemoteDataSource {

  HomeScreenRemoteDataSourceImpl();
  

  final http.Client client = Client();
  
  @override
  Future<HomeScreenModel> getExchangeRate() async {
    final _client = RetryClient(client);
    return await _releaseHomeScreenData(_client, 'exchange_rates');
  }
  
  @override
  Future<HomeScreenModel> getTransactionFee(String? recipientAddress, double? amount, String? currency) async {

    final _client = RetryClient(client);

    try {
      final response = await _client.post(
        Uri.https(
          'crypto-wallet-server.mock.beeceptor.com',
          '/api/v1/transaction_fee',
          {
            'recipientAddress': recipientAddress,
            'amount': amount,
            'currency': currency,
          }
        ),
        headers: {'content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return HomeScreenModel.fromJson(json.decode(response.body));
        
      } else {
        throw ServerException();

      }

    } finally {
      _client.close();

    }

  }
  


  @override
  Future<HomeScreenModel> getUserBalance() async {
    final _client = RetryClient(client);
    return await _releaseHomeScreenData(_client, 'balance');
  }
  
  @override
  Future<HomeScreenModel> getUserTransactions() async {
    final _client = RetryClient(client);
    return await _releaseHomeScreenData(_client, 'transactions');
  }
  

  
  @override
  Future<HomeScreenModel> sendFund(String? recipientAddress, double? amount, String? currency) async {

    final _client = RetryClient(client);

    try {
      final response = await _client.post(
        Uri.https(
          'crypto-wallet-server.mock.beeceptor.com',
          '/api/v1/transactions',
          {
            'recipientAddress': recipientAddress,
            'amount': amount,
            'currency': currency,
          }
        ),
        headers: {'content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return HomeScreenModel.fromJson(json.decode(response.body));
        
      } else {
        throw ServerException();

      }

    } finally {
      _client.close();

    }

  }






  Future<HomeScreenModel> _releaseHomeScreenData(RetryClient client, String path) async {

    try {
      final response = await client.get(
        Uri.https(
          'crypto-wallet-server.mock.beeceptor.com', 
          '/api/v1/$path',
        ),
      );

      if (response.statusCode == 200) {
        return HomeScreenModel.fromJson(json.decode(response.body));
        
      } else {
        throw ServerException();

      }

    } finally {
      client.close();

    }

  }






}
