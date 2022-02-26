// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/SanPhamYeuThich.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class APIThemSPYT extends ChangeNotifier {
  Future<SanPhamYeuThich> ThemSPyeuthich(int IDTaiKhoan, int IDSanPham) async {
    // IDTaiKhoan=1;
    final response = await http.post(
      Uri.parse('http://192.168.5.192:8000/api/SanPhamYeuThich/ThemMoi'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: {
        'IdTaiKhoan': IDTaiKhoan.toString(),
        'IdSanPham': IDSanPham.toString(),
      },
    );

    if (response.statusCode == 200) {
      return SanPhamYeuThich.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ngu như chó có nhiêu đó làm không xong');
    }
  }
}
