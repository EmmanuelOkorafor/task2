// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'dart:convert';


import '../../../../../web_core/auth/auth.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

import '../../../../web_core/auth/auth_model.dart';
import '../../../../web_core/errors/exceptions.dart';
import '../../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String? username, String? password);
}


class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {

   
  LoginRemoteDataSourceImpl();

  final http.Client client = Client();
  final AuthenticationFragmentsImpl authFragments = AuthenticationFragmentsImpl();


  @override
  Future<LoginModel> login(String? username, String? password) async {
    final _client = RetryClient(client);

    try {
      final response = await _client.post(
        Uri.https(
          'crypto-wallet-server.mock.beeceptor.com', 
          '/api/v1/login',
          {
            'username': username,
            'password': password,
          }
        ),
        headers: {'content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        try{
          await authFragments.setAccessToken(AuthModel.fromJson(json.decode(response.body)));
          return LoginModel.fromJson(json.decode(response.body));

        } on CacheException {
          throw CacheException(); 
        }

      } else {
        throw ServerException();
  
      }

    } finally  {
      client.close();
    
    }
  }
  

}