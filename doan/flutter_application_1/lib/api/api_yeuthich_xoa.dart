// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/SanPhamYeuThich.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class APIXoaSPYT extends ChangeNotifier {
  Future<void> XoaSPYT(int IdTaiKhoan, int Idsanpham) async {
    List<SanPhamYeuThich> tmpList = [];
    List<SanPhamYeuThich> lst = [];
    final http.Response response = await http.delete(
        Uri.parse('http://192.168.5.192:8000/api/SanPhamYeuThich/Xoa/$IdTaiKhoan/$Idsanpham'),
        // body: {
        //   'IdTaiKhoan': IDTaiKhoan.toString(),
        //   'IdSanPham': Idsanpham.toString(),
        // }
        );

    if (response.statusCode == 200) {
      dynamic object = json.decode(response.body);
      dynamic data = object['data'];
      data.forEach((item) {
        tmpList.add(SanPhamYeuThich.fromJson(item));
      });
    } else {
     
      throw Exception('khong xoa duoc');
    }
    lst = tmpList;
    notifyListeners();
  }
}
