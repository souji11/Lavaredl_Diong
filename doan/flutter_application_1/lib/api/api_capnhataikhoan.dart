// ignore_for_file: unused_import, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/URL.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/user.dart';

Future<User> apiUpdate(User user) async {
  print("abc");
  User acc;
  String url = "http://127.0.0.1:8000/api/User/update/${Auth.user.id}";
  var response = await http.post(Uri.parse(url),
      headers: _header(), body: jsonEncode(user.toJson()));
  if (response.statusCode == 200) {
    final jsondata = json.decode(response.body);
    acc = User.fromJson(jsondata);
  } else {
    throw Exception("Fail");
  }
  return acc;
}

_header() => {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };
