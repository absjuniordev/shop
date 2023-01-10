import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBJetNlvNQ9Akq7jhT2s3iltoa8CrpKxoc';

  Future<void> _authenticate(
      String email, String password, String urlFragmente) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragmente?key=AIzaSyBJetNlvNQ9Akq7jhT2s3iltoa8CrpKxoc';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
  }

  Future<void> signup(String email, String password) async {
    _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    _authenticate(email, password, 'signInWithPassword');
  }
}
