// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'product.dart';

class OrderDetails {
  late int? id;
  late int? IdHoaDon;
  late int? IdSanPham;
  late int? SoLuong;
  late double? DonGia;

  OrderDetails({
    this.id,
    this.IdHoaDon,
    this.IdSanPham,
    this.SoLuong,
    this.DonGia,
  });

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    IdHoaDon = json['IdHoaDon'];
    IdSanPham = json['IdSanPham'];
    SoLuong = json['SoLuong'];
    DonGia = json['DonGia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['IdHoaDon'] = IdHoaDon;
    data['IdSanPham'] = IdSanPham;
    data['SoLuong'] = SoLuong;
    data['DonGia'] = DonGia;
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
