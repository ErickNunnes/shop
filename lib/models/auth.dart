import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class Auth with ChangeNotifier {
  static const _url =
    'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${Constants.webApiKey}';

  //  https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY];
  //  https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY];



  Future<void> _authenticate(String email, String password, String urlFragment) async {
    final _url = 
    'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyCzbXhIUrnWOc9p-JHNW9HnwdXu5UjWXH4';
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
  }

  Future<void> signup(String email, String password) async {
    _authenticate(email, password, 'signUp');
  }
  Future<void> login(String email, String password) async {
    _authenticate(email, password, 'signInWithPassword');
  }
}