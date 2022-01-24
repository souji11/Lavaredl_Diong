import 'package:flutter/material.dart';
import 'product.dart';

class Order {
  final int ID;
  final String code;
  final Product product;
  final int soluong;
  final DateTime ngaylap;
  final String ngaygiao;
  final int tongtien;
  final String trangthai;

  Order(
      {required this.ID,
      required this.code,
      required this.product,
      required this.soluong,
      required this.ngaylap,
      required this.ngaygiao,
      required this.tongtien,
      required this.trangthai});
}

final List<Order> oder = [
  Order(
      ID: 0,
      code: '123456',
      product: products[0],
      soluong: 1,
      ngaylap: DateTime.now(),
      ngaygiao: '12/12/2020',
      tongtien: products[0].Gia * 1,
      trangthai: 'Đơn hàng mới'),
  Order(
      ID: 1,
      code: '234567',
      product: products[1],
      soluong: 2,
      ngaylap: DateTime.now(),
      ngaygiao: '12/12/2020',
      tongtien: products[1].Gia * 2,
      trangthai: 'Đã giao hàng'),
  Order(
      ID: 2,
      code: '345678',
      product: products[2],
      soluong: 2,
      ngaylap: DateTime.now(),
      ngaygiao: '12/12/2020',
      tongtien: products[2].Gia * 2,
      trangthai: 'Đang giao hàng'),
];
