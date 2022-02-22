// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api/URL.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/user.dart';

class Apidangky extends ChangeNotifier {
  Future<User> DangKyUser(String SDT, String password, String Email) async {
    final response = await http.post(Uri.parse(registerURL), body: {
      'SDT': SDT.toString(),
      'password': password.toString(),
      'email': Email.toString(),
    });
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }
}
