// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, unused_element
// ignore_for_file: unused_import, unused_element, avoid_web_libraries_in_flutter

<<<<<<< HEAD
import 'dart:html';
=======

// import 'dart:html';
>>>>>>> dfe176d6a45deda8aa7cad8eb7257de0d5a2d893

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Models/user.dart';
import 'URL.dart';

Future<User> apiLogin(String emailSDT, String password) async {
  User tk;
  String url = loginURL;
  var response = await http.post(Uri.parse(url), body: {"email": emailSDT, "password": password, "SDT": emailSDT});
  if (response.statusCode == 200) {
    final jsondata = json.decode(response.body);
    tk = User.fromJson(jsondata);
  } else {
    throw Exception("Fail");
  }
  return tk;
}

_header() => {'Content-Type': 'application/json; charset=utf-8', 'Accept': 'application/json'};
