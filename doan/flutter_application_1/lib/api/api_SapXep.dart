// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print, file_names

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class ApiSapXep extends ChangeNotifier {
  List<Product_main> lstA = [];
  List<Product_main> lstTS = [];
  List<Product_main> lstG = [];
  List<Product_main> lstT = [];
  Future<void> SapXepAo(String $Loai) async {
    List<Product_main> tmpList = [];

    final response = await http
        .get(Uri.parse('http://192.168.5.186:8000/api/SanPham/xepAO/' + $Loai));

    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        data.forEach((item) {
          tmpList.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }
      lstA = tmpList;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> SapXepTrangSuc(String $Loai) async {
    List<Product_main> tmpList = [];

    final response = await http.get(Uri.parse(
        'http://192.168.5.186:8000/api/SanPham/xepTRANGSUC/' + $Loai));

    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        // print(data);
        data.forEach((item) {
          tmpList.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }

      lstTS = tmpList;
// print(lstTS[0].gia);
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> SapXepTuiXach(String $Loai) async {
    List<Product_main> tmpList = [];

    final response = await http.get(
        Uri.parse('http://192.168.5.186:8000/api/SanPham/xepTUI/' + $Loai));

    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        // print(data);
        data.forEach((item) {
          tmpList.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }

      lstT = tmpList;
// print(lstTS[0].gia);
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> SapXepGiayDep(String $Loai) async {
    List<Product_main> tmpList = [];

    final response = await http.get(
        Uri.parse('http://192.168.5.186:8000/api/SanPham/xepGIAY/' + $Loai));

    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        // print(data);
        data.forEach((item) {
          tmpList.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }

      lstG = tmpList;
// print(lstTS[0].gia);
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
