// ignore_for_file: unused_import, non_constant_identifier_names, unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/URL.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/user.dart';

Future<User> apiForGotPass(String email, String SDT, String oldPass,
    String newPass, String newPassConfirm) async {
  User tk;
<<<<<<< HEAD
  String url = "http://192.168.5.186:8000/api/User/forgotpass";
=======
  String url = "http://192.168.5.192:8000/api/User/forgotpass";
>>>>>>> 42839604db4ec7803ac69c5b42568f8c2adba0ca
  var response = await http.post(Uri.parse(url), body: {
    "email": email,
    "SDT": SDT,
    "oldPass": oldPass,
    "newPass": newPass,
    "newPassConfirm": newPassConfirm
  });
  if (response.statusCode == 200) {
    final jsondata = json.decode(response.body);
    tk = User.fromJson(jsondata);
  } else {
    throw Exception("Fail");
  }
  return tk;
}

_header() => {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };
