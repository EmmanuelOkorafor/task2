// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'dart:io';
import 'package:http/http.dart' as http;



abstract class Network {
  Future<bool> get isConnected;
}

class NetworkImpl implements Network {
  
  // final InternetConnectionChecker connectionChecker;

  NetworkImpl();

  late Future<bool> hasConnection;

  @override 
  Future<bool> get isConnected async => await checkNetwork();

  Future<bool> checkNetwork() async {
    try {
      final result = await http.get(Uri.https('google.com'));
      if(result.statusCode == 200) {
        return true;
      
      } else {
        return false;
      }
    
    } on SocketException catch (_) { return false;}
  }



}