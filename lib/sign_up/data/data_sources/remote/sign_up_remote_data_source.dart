// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'dart:convert';


import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

import '../../../../web_core/errors/exceptions.dart';
import '../../models/sign_up_model.dart';


abstract class SignUpRemoteDataSource {
  Future<SignUpModel> signUserUp(String? emailAddress, String? password, String? userName);
}





class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {


  SignUpRemoteDataSourceImpl();

  final http.Client client = Client();
 


  @override
  Future<SignUpModel> signUserUp(String? emailAddress, String? password, String? userName) async {
    
    final _client = RetryClient(client);

    try {
      final response = await _client.post(
        Uri.https(
          'crypto-wallet-server.mock.beeceptor.com',
          '/api/v1/register',
          {
            'email': emailAddress,
            'password': password,
            'username': userName,
            
          }
        ),
        headers: {'content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return SignUpModel.fromJson(json.decode(response.body));
      
      } else {
        throw ServerException();
      
      }

    } finally  {
      client.close();
   
    }
  }
 
}