// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print, avoid_function_literals_in_foreach_calls

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
<<<<<<< HEAD
    final response = await http.get(Uri.parse(
        'http://192.168.5.186:8000/api/User/${Auth.user.id}/HoaDon/all'));
=======
    final response = await http.get(Uri.parse('http://192.168.5.192:8000/api/User/${Auth.user.id}/HoaDon/all'));
>>>>>>> 42839604db4ec7803ac69c5b42568f8c2adba0ca
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
<<<<<<< HEAD
    final response = await http.get(Uri.parse(
        'http://192.168.5.186:8000/api/User/${Auth.user.id}/HoaDon?IdTrangThai=$TrangThai'));
=======
    final response = await http.get(Uri.parse('http://192.168.5.192:8000/api/User/${Auth.user.id}/HoaDon?IdTrangThai=$TrangThai'));
>>>>>>> 42839604db4ec7803ac69c5b42568f8c2adba0ca
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
