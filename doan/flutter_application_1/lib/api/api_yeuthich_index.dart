// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/SanPhamYeuThich.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class ApiYT extends ChangeNotifier {
  List<SanPhamYeuThich> lst = [];
  List<Product_main> lstProduct = [];
  Future<void> fetchProduct_YT() async {
    List<SanPhamYeuThich> tmpList = [];
    List<Product_main> tmpListProduct = [];
    final response = await http.get(
      Uri.parse('http://192.168.5.192:8000/api/SanPhamYeuThich'),
    );
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        data.forEach((item) {
          tmpListProduct.add(Product_main.fromJson(item));
          tmpList.add(SanPhamYeuThich.fromJson(item));
        });
      } catch (e) {
        print(e);
      }
      lst = tmpList;
      lstProduct = tmpListProduct;

      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
