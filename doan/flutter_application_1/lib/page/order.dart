// ignore_for_file: prefer_const_constructors_in_immutables, unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, duplicate_ignore, override_on_non_overriding_member, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_hoadon.dart';
import 'package:flutter_application_1/api/api_sanpham_index.dart';
import 'package:flutter_application_1/page/order_all.dart';
import 'package:provider/provider.dart';
import '../Models/product.dart';
import '../Models/order.dart';
import 'invoice_detail.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> with SingleTickerProviderStateMixin {
  int active = 0;

  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispone() {
    controller.dispose();
    super.dispose();
  }

  int? TrangThai;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn hàng'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade300,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(text: 'Tất cả', icon: Icon(Icons.all_inbox)),
            Tab(text: 'Đơn mới đặt', icon: Icon(Icons.next_week_outlined)),
            Tab(text: 'Đơn đã xử lý', icon: Icon(Icons.polymer_rounded)),
            Tab(
                text: 'Đơn đang vận chuyển',
                icon: Icon(Icons.local_shipping_outlined)),
            Tab(text: 'Đơn đã hoàn thành', icon: Icon(Icons.done_all_outlined)),
            Tab(text: 'Đơn đã hủy', icon: Icon(Icons.delete_forever_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          PageOrderAll(TrangThai: 0),
          PageOrderAll(TrangThai: 1),
          PageOrderAll(TrangThai: 2),
          PageOrderAll(TrangThai: 3),
          PageOrderAll(TrangThai: 4),
          PageOrderAll(TrangThai: 5),
        ],
      ),
    );
  }
}
