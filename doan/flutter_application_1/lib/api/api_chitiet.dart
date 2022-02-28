// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Models/mau.dart';
import 'package:flutter_application_1/Models/size.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/SanPhamYeuThich.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class ApiCT extends ChangeNotifier {
  List<Mau> lstmau = [];
  List<size> lstsize = [];
  Future<void> fetchProduct_CT() async {
    List<Mau> tmpListmau = [];
    List<size> tmpListSize = [];
    final response = await http.get(
      Uri.parse('http://192.168.5.192:8000/api/SanPham/chitiet/mausize'),
    );
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['dataMau'];
        data.forEach((item) {          
          tmpListmau.add(Mau.fromJson(item));
        });
        dynamic dataSize = object['dataSize'];
        dataSize.forEach((item) {
          tmpListSize.add(size.fromJson(item));
        });
      } catch (e) {
        print(e);
      }
      lstmau = tmpListmau;
      lstsize = tmpListSize;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
