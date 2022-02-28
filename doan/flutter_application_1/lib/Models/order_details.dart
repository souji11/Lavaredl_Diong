// ignore_for_file: unused_import, non_constant_identifier_names, unnecessary_new, prefer_collection_literals, unnecessary_null_comparison, unnecessary_this

import 'package:flutter/material.dart';
import 'product.dart';
import 'Product_main.dart';

class OrderDetails {
  late int? id;
  late int? IdHoaDon;
  late int? IdSanPham;
  late int? SoLuong;
  late int? DonGia;
  late Product_main sanPham;

  OrderDetails({
    this.id,
    this.IdHoaDon,
    this.IdSanPham,
    this.SoLuong,
    this.DonGia,
    required this.sanPham,
  });

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    IdHoaDon = json['IdHoaDon'];
    IdSanPham = json['IdSanPham'];
    SoLuong = json['SoLuong'];
    DonGia = json['DonGia'];
    sanPham = (json['san_pham'] != null
        ? new Product_main.fromJson(json['san_pham'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['IdHoaDon'] = IdHoaDon;
    data['IdSanPham'] = IdSanPham;
    data['SoLuong'] = SoLuong;
    data['DonGia'] = DonGia;
    if (this.sanPham != null) {
      data['san_pham'] = this.sanPham.toJson();
    }
    return data;
  }

  OrderDetails.empty() {
    id = -1;
    IdHoaDon = -1;
    IdSanPham = -1;
    SoLuong = -1;
    DonGia = -1;
  }
}
