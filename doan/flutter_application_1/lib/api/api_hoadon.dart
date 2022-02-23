// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/api/Auth.dart';

import '../Models/product.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';
import '../Models/order.dart';

Future<List<Order>> fetchHoaDon_main(int TrangThai) async {
  List<Order> lst = [];
  if (TrangThai == 0) {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/User/${Auth.user.id}/HoaDon/all'));
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        List data = object['data'];
        //lst = data.map((value) => Order.fromJson(value)).toList();
        data.forEach((item) {
          lst.add(Order.fromJson(item));
        });
      } catch (e) {
        print(e);
      }
    } else {
      throw Exception('Failed to load data');
    }
  } else {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/User/${Auth.user.id}/HoaDon?IdTrangThai=$TrangThai'));
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        List data = object['data'];
        data.forEach((item) {
          lst.add(Order.fromJson(item));
        });
      } catch (e) {
        print(e);
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
  return lst;
}
