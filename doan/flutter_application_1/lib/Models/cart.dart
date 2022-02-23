// import 'package:flutter/material.dart';
// ignore_for_file: unused_import, unnecessary_this, prefer_collection_literals, unnecessary_new, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'product.dart';

// class Cart {
//   int id;
//   int idSanPham;
//   int idTaiKhoan;
//   int soLuong;
//   String tenSanPham;
//   int gia;
//   String moTa;
//   int idLoaiSanPham;
//   int idNhaCung;
//   String hinhAnh;
//   int trangThai;

//   Cart(
//       {required this.id,
//       required this.idSanPham,
//       required this.idTaiKhoan,
//       required this.soLuong,
//       required this.tenSanPham,
//       required this.gia,
//       required this.moTa,
//       required this.idLoaiSanPham,
//       required this.idNhaCung,
//       required this.hinhAnh,
//       required this.trangThai});

//   Cart.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         idSanPham = json['IdSanPham'],
//         idTaiKhoan = json['IdTaiKhoan'],
//         soLuong = json['SoLuong'],
//         tenSanPham = json['TenSanPham'],
//         gia = json['Gia'],
//         moTa = json['MoTa'],
//         idLoaiSanPham = json['IdLoaiSanPham'],
//         idNhaCung = json['IdNhaCung'],
//         hinhAnh = json['HinhAnh'],
//         trangThai = json['TrangThai'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['IdSanPham'] = this.idSanPham;
//     data['IdTaiKhoan'] = this.idTaiKhoan;
//     data['SoLuong'] = this.soLuong;
//     data['TenSanPham'] = this.tenSanPham;
//     data['Gia'] = this.gia;
//     data['MoTa'] = this.moTa;
//     data['IdLoaiSanPham'] = this.idLoaiSanPham;
//     data['IdNhaCung'] = this.idNhaCung;
//     data['HinhAnh'] = this.hinhAnh;
//     data['TrangThai'] = this.trangThai;
//     return data;
//   }
// }

class Cart {
  int id;
  int idSanPham;
  int idTaiKhoan;
  int so_Luong;

  String tenSanPham;
  int gia;
  String moTa;
  int soLuong;
  int idLoaiSanPham;
  int idNhaCung;
  String hinhAnh;
  int trangThai;

  Cart(
      {required this.id,
      required this.idSanPham,
      required this.idTaiKhoan,
      required this.so_Luong,
      required this.tenSanPham,
      required this.gia,
      required this.moTa,
      required this.soLuong,
      required this.idLoaiSanPham,
      required this.idNhaCung,
      required this.hinhAnh,
      required this.trangThai});

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idSanPham = json['IdSanPham'],
        idTaiKhoan = json['IdTaiKhoan'],
        so_Luong = json['so_luong'],
        tenSanPham = json['TenSanPham'],
        gia = json['Gia'],
        moTa = json['MoTa'],
        soLuong = json['SoLuong'],
        idLoaiSanPham = json['IdLoaiSanPham'],
        idNhaCung = json['IdNhaCung'],
        hinhAnh = json['HinhAnh'],
        trangThai = json['TrangThai'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['IdSanPham'] = this.idSanPham;
    data['IdTaiKhoan'] = this.idTaiKhoan;
    data['so_luong'] = this.so_Luong;
    data['TenSanPham'] = this.tenSanPham;
    data['Gia'] = this.gia;
    data['MoTa'] = this.moTa;
    data['SoLuong'] = this.soLuong;
    data['IdLoaiSanPham'] = this.idLoaiSanPham;
    data['IdNhaCung'] = this.idNhaCung;
    data['HinhAnh'] = this.hinhAnh;
    data['TrangThai'] = this.trangThai;
    return data;
  }
}
