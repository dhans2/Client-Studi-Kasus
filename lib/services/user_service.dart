import 'dart:convert';

import 'package:flutter_auth/env/env.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<CreateUser> createNewUser(String first_name, String last_name,
      String username, String password, String login_type) async {
    final response = await http.post(Uri.parse(Envirotment.endpointCreateUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "first_name": first_name,
          "last_name": last_name,
          "username": username,
          "password": password,
          "login_type": login_type
        }));

    if (response.statusCode == 200) {
      print(response.body);
      return CreateUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Create User');
    }
  }

  static Future<ResponseSuccessLogin> loginUser(
      String email, String password) async {
    final response = await http.post(Uri.parse(Envirotment.endpointLoginUser),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));

    if (response.statusCode == 200) {
      return ResponseSuccessLogin.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
