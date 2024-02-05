// Copyright (c) 2022 Goyerv Ltd. All rights reserved.
// Author: Emmanuel Okorafor








import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../errors/errors.dart';
import '../errors/exceptions.dart';
import 'auth_model.dart';



const String accessToken = "access_token_key";


abstract class AuthenticationFragments {

  Future<AuthModel> getAccessToken();
  Future<Either<Errors, AuthModel>?> setAccessToken(AuthModel modelToCache);
  
}

class AuthenticationFragmentsImpl implements AuthenticationFragments {


  AuthenticationFragmentsImpl();
    
  @override
  Future<AuthModel> getAccessToken() async {

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final access_token = sharedPreferences.getString(accessToken);

    if (access_token != null) {
      return AuthModel(accessToken: access_token);
    
    } else {
      throw CacheException();
    
    }
  }

  @override
  Future<Either<Errors, AuthModel>?> setAccessToken(AuthModel modelToCache) async {

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      sharedPreferences.setString(accessToken, modelToCache.accessToken!);
    
    } on CacheException {
      throw CacheException();
    
    }
    return null;
  }

}