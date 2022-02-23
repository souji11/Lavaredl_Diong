// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Models/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/product.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class ApiThemGioHang extends ChangeNotifier {
  Future<Cart> ThemGioHang(int IDTaiKhoan, int IDSanPham, int so_Luong) async {
    final response = await http
<<<<<<< HEAD
        .post(Uri.parse('http://192.168.5.192:8000/api/GioHang/them'), body: {
=======
        .post(Uri.parse('http://192.168.5.186:8000/api/GioHang/them'), body: {
>>>>>>> 4d3ebf402b8ec72ba627c8fe014d1ce527f45d2a
      'IdSanPham': IDSanPham.toString(),
      'IdTaiKhoan': IDTaiKhoan.toString(),
      'so_luong': so_Luong.toString(),
    });
    if (response.statusCode == 200) {
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('khong them duoc');
    }
  }
}
