// ignore_for_file: unused_import, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

<<<<<<< HEAD
const baseURL = "http://192.168.5.192:8000/api";
=======
const baseURL = "http://192.168.5.186:8000/api";
>>>>>>> 4d3ebf402b8ec72ba627c8fe014d1ce527f45d2a
const loginURL = baseURL + "/User/login";
const registerURL = baseURL + "/User/register";
const logoutURL = baseURL + "User/logout";
const userURL = baseURL + "User/user";
String updateURL = baseURL + "User/update/${Auth.user.id}";

const serverError = "Server error";
const uanauthorized = "Uanauthorized";
const somgThingWenWrong = "Some thing went wrong";

InputDecoration kInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    contentPadding: EdgeInsets.all(10),
    border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
  );
}

void showLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..radius = 50
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.indigo
    ..textColor = Colors.indigo
    ..fontSize = 20;
  EasyLoading.show(
    status: "Please wait...",
    maskType: EasyLoadingMaskType.black,
  );
}
