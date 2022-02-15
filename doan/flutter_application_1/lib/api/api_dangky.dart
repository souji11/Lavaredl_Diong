import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/user.dart';

class Apidangky extends ChangeNotifier {
  Future<User> DangKyUser(String SDT, String password) async {
    final response = await http
        .post(Uri.parse("http://127.0.0.1:8000/api/User/register"), body: {
      'SDT': SDT.toString(),
      'password': password.toString(),
    });
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }
}
