<<<<<<< HEAD
// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, unused_element
=======
// ignore_for_file: unused_import, unused_element, avoid_web_libraries_in_flutter
>>>>>>> 78495d986ce2ada033d5881f7d0eae31995b59cd

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Models/user.dart';
import 'URL.dart';

Future<User> apiLogin(String emailSDT, String password) async {
  User acc;
  String url = loginURL;
  var response = await http.post(Uri.parse(url),
      body: {"email": emailSDT, "password": password, "SDT": emailSDT});
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
