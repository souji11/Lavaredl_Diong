// ignore_for_file: unused_element, unused_import

import 'package:flutter/cupertino.dart';


import 'package:flutter_application_1/api/Auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/user.dart';

Future<User> apiChangePass(
    String oldPass, String newPass, String newPassConfirm) async {
  User acc;
<<<<<<< HEAD
  String url = "http://192.168.5.192:8000/api/User/changepass/${Auth.user.id}";
=======
  String url = "http://192.168.5.186:8000/api/User/changepass/${Auth.user.id}";
>>>>>>> 4d3ebf402b8ec72ba627c8fe014d1ce527f45d2a
  var response = await http.post(Uri.parse(url), body: {
    "oldPass": oldPass,
    "newPass": newPass,
    "newPassConfirm": newPassConfirm
  });
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
