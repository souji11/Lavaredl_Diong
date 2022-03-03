// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Models/binhluan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/SanPhamYeuThich.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class APICMT extends ChangeNotifier {
  List<binhluan> lst = [];
  Future<void> BinhLuan(Product_main SanPham) async {
    // IDTaiKhoan=1;
    List<binhluan> tmpList = [];
    final response = await http.get(
      Uri.parse(
          'http://192.168.5.186:8000/api/BinhLuan/' + SanPham.id.toString()),
    );
    // headers: {
    //   "Content-Type": "application/json",
    //   "Accept": "application/json",
    // },
    // body: {
    //   'IdSanPham': SanPham.id,
    // },

    print(response.statusCode);
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        data.forEach((item) {
          tmpList.add(binhluan.fromJson(item));
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
}
