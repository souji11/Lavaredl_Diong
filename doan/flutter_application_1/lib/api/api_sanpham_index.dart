// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class Api extends ChangeNotifier {
  List<Product_main> lst = [];
List<Product_main> lstBanChay = [];
List<Product_main> lstNoiBat = [];
List<Product_main> lstMoi = [];
  Future<void> fetchProduct_main() async {
    List<Product_main> tmpList = [];

    final response = await http.get(
<<<<<<< HEAD
      Uri.parse('http://127.0.0.1:8000/api/SanPham'),
=======
      Uri.parse('http://192.168.5.186:8000/api/SanPham'),
>>>>>>> dfe176d6a45deda8aa7cad8eb7257de0d5a2d893
    );
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

      lst = tmpList;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<void> fetchProduct_NoiBat() async {
    List<Product_main> tmpListNoiBat = [];

    final response = await http.get(
      Uri.parse('http://192.168.5.192:8000/api/SanPham/noibat'),
    );
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        data.forEach((item) {
          tmpListNoiBat.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }

      lstNoiBat = tmpListNoiBat;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<void> fetchProduct_BanChay() async {
    List<Product_main> tmpListBanChay = [];

    final response = await http.get(
      Uri.parse('http://192.168.5.192:8000/api/SanPham/banchay'),
    );
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        data.forEach((item) {
          tmpListBanChay.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }

      lstBanChay = tmpListBanChay;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<void> fetchProduct_Moi() async {
    List<Product_main> tmpListMoi = [];

    final response = await http.get(
      Uri.parse('http://192.168.5.192:8000/api/SanPham/moi'),
    );
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        data.forEach((item) {
          tmpListMoi.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }

      lstMoi = tmpListMoi;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
  
}
