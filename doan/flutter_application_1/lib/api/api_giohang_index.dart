// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Models/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class ApiGioHang extends ChangeNotifier {
  List<Cart> lst = [];
  late int total;
  Future<void> fetchgiohang() async {
    List<Cart> tmpList = [];
    // int ?total = 0;
    final response = await http.get(
      Uri.parse('http://192.168.5.192:8000/api/GioHang'),
    );

    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic data = object['data'];
        print(data);
        data.forEach((item) {
          tmpList.add(Cart.fromJson(item));
        });
        dynamic tmpTotal = object['total'];
        total = tmpTotal;
      } catch (e) {
        print(e);
      }
      lst = tmpList;
      
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> XoaGioHang(int IDTaiKhoan, int Idsanpham) async {
    List<Cart> tmpList = [];
    final response = await http
        .post(Uri.parse('http://192.168.5.192:8000/api/GioHang/xoa'), body: {
      'IdTaiKhoan': IDTaiKhoan.toString(),
      'IdSanPham': Idsanpham.toString(),
    });
    if (response.statusCode == 200) {
      dynamic object = json.decode(response.body);
      dynamic data = object['data'];
      data.forEach((item) {
        tmpList.add(Cart.fromJson(item));
      });
    } else {
      throw Exception('khong xoa duoc');
    }
    lst = tmpList;
    notifyListeners();
  }

  Future<void> Thanhtoan(
    // String Code,
    int IdTaiKhoan,
    //DateTime NgayLap,
    String DiaChiGiaoHang,
    String SDTGiaoHang,
    int TongTien,
    int IdTrangThai,
    // int IdHoaDon,
  ) async {
    final response = await http.post(
        Uri.parse('http://192.168.5.192:8000/api/GioHang/thanhtoan'),
        body: {
          //'Code': Code,
          'IdTaiKhoan': IdTaiKhoan.toString(),
          //'NgayLap': NgayLap.toString(),
          'DiaChiGiaoHang': DiaChiGiaoHang,
          'SDTGiaoHang': SDTGiaoHang,
          //'IdMaGiamGia': IdMaGiamGia.toString(),
          'TongTien': TongTien.toString(),
          'IDTrangThai': IdTrangThai.toString(),
          //'IdTrangThai': IdMaGiamGia.toString(),
          //'IdHoaDon': IdHoaDon.toString(),
          // 'IdSanPham': IdSanPham.toString(),
          // 'SoLuong': SoLuong.toString(),
          // 'DonGia': DonGia.toString(),
        });
    if (response.statusCode == 200) {
      dynamic object = json.decode(response.body);
    } else {
      throw Exception('khong xoa duoc');
    }

    fetchgiohang();
  }
}
