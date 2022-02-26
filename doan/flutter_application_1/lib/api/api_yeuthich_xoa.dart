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
  Future<SanPhamYeuThich> XoaSPYT(Product_main $a) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.5.192:8000/api/SanPhamYeuThich/Xoa/${$a.id}'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
    );

    if (response.statusCode == 200) {
      return SanPhamYeuThich.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete .');
    }
  }
}
