// ignore_for_file: deprecated_member_use, unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/order_details.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_huyhoadon.dart';
import 'package:flutter_application_1/success/updatesuccess.dart';
import 'package:provider/provider.dart';
import '../Models/product.dart';
import '../Models/order.dart';

class InvoiceDetail extends StatefulWidget {
  final List<OrderDetails> listCtHoaDon;
  final int? S;
  final int? TrangThai;
  final int? IDHoaDon;
  final String? DiaChi;
  final String? SDT;
  InvoiceDetail(this.listCtHoaDon, this.S, this.TrangThai, this.IDHoaDon,
      this.DiaChi, this.SDT,
      {Key? key})
      : super(key: key);
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade300,
        title: Column(
          children: [
            const Text(
              "Chi tiết đơn hàng",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                    height: 60,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 20.0,
                      ),
                    ]),
                    child: Container(
                        child: Row(children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.shop_2_rounded,
                          color: Colors.teal.shade300,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' Mã đơn hàng: #${widget.listCtHoaDon[index].IdHoaDon}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.copy_rounded,
                          color: Colors.teal.shade300,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Trạng thái: ${setTrangThai(widget.TrangThai)}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    ])));
              }),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 20.0,
                    ),
                  ]),
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.teal.shade300,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Thông tin người mua : ',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              ' + ${Auth.user.name}',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              ' + ${widget.SDT} ',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              ' + ${widget.DiaChi} ',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget.listCtHoaDon.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 140,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 20.0,
                    ),
                  ]),
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets'+ widget.listCtHoaDon[index].sanPham.hinhAnh)),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Tên sản phẩm : ${widget.listCtHoaDon[index].sanPham.tenSanPham}'),
                                    Text(
                                        'Sô lượng    : ${widget.listCtHoaDon[index].SoLuong}'),
                                    Text(
                                        'Đơn giá       : ${widget.listCtHoaDon[index].sanPham.gia}'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 130,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
            ),
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Tổng tiền: ${widget.S}',
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (widget.TrangThai != 1) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Đơn hàng mới đặt mới được hủy")));
                        } else {
                          final kq = apiUpdateHoaDon(widget.IDHoaDon);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateSuccess()));
                        }
                      });
                    },
                    color: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Hủy đơn',
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String setTrangThai(int? IDTrangThai) {
    String trangthai = "Error";
    if (IDTrangThai == 1) {
      trangthai = "Đơn mới đặt";
    } else if (IDTrangThai == 2) {
      trangthai = "Đơn đã xử lý";
    } else if (IDTrangThai == 3) {
      trangthai = "Đơn đang vận chuyển";
    } else if (IDTrangThai == 4) {
      trangthai = "Đơn đã hoàn thành";
    } else if (IDTrangThai == 5) {
      trangthai = "Đơn đã hủy";
    }
    return trangthai;
  }
}
