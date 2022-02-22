// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';

class Order2 {
  late int ID;
  late String? Code;
  late int? IdTaiKhoan;
  late DateTime? NgayLap;
  late String? DiaChiGiaoHang;
  late String? SDTGiaoHang;
  late int? IdMaGiamGia;
  late double? TongTien;
  late int IDTrangThai;

  Order2(
      {required this.ID,
      this.Code,
      this.NgayLap,
      this.DiaChiGiaoHang,
      this.SDTGiaoHang,
      this.IdMaGiamGia,
      this.TongTien,
      required this.IDTrangThai});

  Order2.fromJson(Map<String, dynamic> json) {
    ID = json['ID'] ?? 1;
    Code = json['Code'];
    NgayLap = json['NgayLap'] == null
        ? null
        : DateTime.parse(json['NgayLap'] as String);
    DiaChiGiaoHang = json['DiaChiGiaoHang'];
    SDTGiaoHang = json['SDTGiaoHang'];
    IdMaGiamGia = json['IdMaGiamGia'];
    TongTien = json['TongTien'];
    IDTrangThai = json['IDTrangThai'] ?? 1;
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
    return data;
  }

  Order2.empty() {
    ID = -1;
    Code = "";
    NgayLap = null;
    DiaChiGiaoHang = "";
    SDTGiaoHang = "";
    IdMaGiamGia = -1;
    TongTien = -1;
    IDTrangThai = -1;
  }
}
