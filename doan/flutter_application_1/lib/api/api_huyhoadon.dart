// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, unused_element

//import 'dart:html';

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
  var response = await http.post(
      Uri.parse(
          "http://192.168.5.186:8000/api/HoaDon/updateHoaDon/${IdHoaDon}"),
      headers: _header());
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
