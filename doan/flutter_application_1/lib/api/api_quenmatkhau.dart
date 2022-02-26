// ignore_for_file: unused_import, non_constant_identifier_names, unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/URL.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/user.dart';

<<<<<<< HEAD
Future<User> apiForGotPass(String email, String SDT, String oldPass, String newPass, String newPassConfirm) async {
  User tk;
  String url = "http://127.0.0.1:8000/api/User/forgotpass";
  var response =
      await http.post(Uri.parse(url), body: {"email": email, "SDT": SDT, "oldPass": oldPass, "newPass": newPass, "newPassConfirm": newPassConfirm});
=======
Future<User> apiForGotPass(String email, String SDT, String oldPass,
    String newPass, String newPassConfirm) async {
  User acc;
  String url = "http://192.168.5.192:8000/api/User/forgotpass";
  var response = await http.post(Uri.parse(url), body: {
    "email": email,
    "SDT": SDT,
    "oldPass": oldPass,
    "newPass": newPass,
    "newPassConfirm": newPassConfirm
  });
>>>>>>> dfe176d6a45deda8aa7cad8eb7257de0d5a2d893
  if (response.statusCode == 200) {
    final jsondata = json.decode(response.body);
    tk = User.fromJson(jsondata);
  } else {
    throw Exception("Fail");
  }
  return tk;
}

_header() => {'Content-Type': 'application/json; charset=utf-8', 'Accept': 'application/json'};
