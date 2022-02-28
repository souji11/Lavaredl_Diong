// ignore_for_file: unused_import, non_constant_identifier_names, prefer_collection_literals, unnecessary_new, unnecessary_null_comparison, unnecessary_this

import 'package:flutter/material.dart';
import '../Models/order_details.dart';

class Order {
  late int ID;
  late String? Code;
  late int? IdTaiKhoan;
  late DateTime? NgayLap;
  late String? DiaChiGiaoHang;
  late String? SDTGiaoHang;
  late int? IdMaGiamGia;
  late int? TongTien;
  late int IDTrangThai;
  late List<OrderDetails> ctHoaDon;

  Order(
      {required this.ID,
      this.Code,
      this.NgayLap,
      this.DiaChiGiaoHang,
      this.SDTGiaoHang,
      this.IdMaGiamGia,
      this.TongTien,
      required this.IDTrangThai,
      required this.ctHoaDon});

  Order.fromJson(Map<String, dynamic> json) {
    ID = json['id'] as int;
    Code = json['Code'];
    NgayLap = json['NgayLap'] == null
        ? null
        : DateTime.parse(json['NgayLap'] as String);
    DiaChiGiaoHang = json['DiaChiGiaoHang'];
    SDTGiaoHang = json['SDTGiaoHang'];
    IdMaGiamGia = json['IdMaGiamGia'];
    TongTien = json['TongTien'];
    IDTrangThai = json['IDTrangThai'] ?? int;
    ctHoaDon = (json['ct_hoa_don'] as List)
        .map((e) => OrderDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = ID;
    data['Code'] = Code;
    data['NgayLap'] = NgayLap!.toIso8601String();
    data['DiaChiGiaoHang'] = DiaChiGiaoHang;
    data['SDTGiaoHang'] = SDTGiaoHang;
    data['IdMaGiamGia'] = IdMaGiamGia;
    data['TongTien'] = TongTien;
    data['IDTrangThai'] = IDTrangThai;
    if (this.ctHoaDon != null) {
      data['ct_hoa_don'] = this.ctHoaDon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
  // Order.empty() {
  //   ID = -1;
  //   Code = "";
  //   NgayLap = null;
  //   DiaChiGiaoHang = "";
  //   SDTGiaoHang = "";
  //   IdMaGiamGia = -1;
  //   TongTien = -1;
  //   IDTrangThai = -1;
  //   ctHoaDon = null;
  // }
