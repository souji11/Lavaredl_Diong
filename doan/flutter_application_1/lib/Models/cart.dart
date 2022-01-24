// ignore: unused_import
import 'package:flutter/material.dart';
import 'product.dart';

class Cart {
  final Product product;
  final int soluong;

  Cart({required this.product, required this.soluong});
}

// ignore: non_constant_identifier_names
List<Cart> cart = [
  Cart(product: products[0], soluong: 2),
  Cart(product: products[1], soluong: 1),
  Cart(product: products[2], soluong: 1),
];
