import 'package:flutter/material.dart';

const baseURL = "http://127.0.0.1:8000/api";
const loginURL = baseURL + "/User/login";
const registerURL = baseURL + "/User/register";
const logoutURL = baseURL + "User/logout";
const userURL = baseURL + "User/user";

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
