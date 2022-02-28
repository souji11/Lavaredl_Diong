// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, unused_element, unnecessary_brace_in_string_interps, non_constant_identifier_names

<<<<<<< HEAD
//import 'dart:html';
=======
// import 'dart:html';
>>>>>>> 42839604db4ec7803ac69c5b42568f8c2adba0ca

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Models/order.dart';
import 'URL.dart';

Future<Order> apiUpdateHoaDon(int? IdHoaDon) async {
  Order order;
<<<<<<< HEAD
  var response = await http.post(
      Uri.parse(
          "http://192.168.5.186:8000/api/HoaDon/updateHoaDon/${IdHoaDon}"),
      headers: _header());
=======
  var response = await http.post(Uri.parse("http://192.168.5.192:8000/api/HoaDon/updateHoaDon/${IdHoaDon}"), headers: _header());
>>>>>>> 42839604db4ec7803ac69c5b42568f8c2adba0ca
  if (response.statusCode == 200) {
    final jsondata = json.decode(response.body);
    order = Order.fromJson(jsondata);
  } else {
    throw Exception("Fail");
  }
  return order;
}

_header() => {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };
