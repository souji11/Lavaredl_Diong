// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';
import '../Models/Product_main.dart';
import 'package:provider/provider.dart';

class Apiao extends ChangeNotifier {
  List<Product_main> lsta = [];
  Future<void> fetchProduct_main() async {
    List<Product_main> tmpList = [];
<<<<<<< HEAD
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/SanPham/ao'));
  if (response.statusCode == 200) {
   try{
     dynamic object = json.decode(response.body);
     dynamic dataao = object['dataao'];
     dataao.forEach((item){
       tmpList.add(Product_main.fromJson(item));
     });
   }
   catch(e)
   {
     print(e);
   }
    
    lsta = tmpList;
    notifyListeners();
    
  } 
  else {
    
    throw Exception('Failed to load data');
=======
    final response =
        await http.get(Uri.parse('http://192.168.5.192:8000/api/SanPham/ao'));
    if (response.statusCode == 200) {
      try {
        dynamic object = json.decode(response.body);
        dynamic dataao = object['dataao'];
        dataao.forEach((item) {
          tmpList.add(Product_main.fromJson(item));
        });
      } catch (e) {
        print(e);
      }

      lsta = tmpList;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
>>>>>>> dfe176d6a45deda8aa7cad8eb7257de0d5a2d893
  }
}
