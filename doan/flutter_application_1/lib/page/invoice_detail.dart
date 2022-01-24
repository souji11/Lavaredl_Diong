// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../Models/product.dart';
import '../Models/order.dart';

class InvoiceDetail extends StatefulWidget {
  InvoiceDetail({Key? key}) : super(key: key);

  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Column(
          // ignore: prefer_const_literals_to_create_immutables
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
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 20,
          ),
          Positioned(
            top: 320,
            child: Container(
              height: 60,
              //width: 50,
              decoration: BoxDecoration(color: Colors.white,
                  //borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, //Color(0xFFd8dbe0),
                      offset: Offset(1, 1),
                      blurRadius: 20.0,
                    ),
                  ]),
              child: Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   #${oder[0].code}',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ngày giao : ${oder[0].ngaygiao}',
                          style: TextStyle(fontSize: 16, color: Colors.orange),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Positioned(
            top: 320,
            child: Container(
              height: 120,
              //width: 50,
              decoration: BoxDecoration(color: Colors.white,
                  //borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, //Color(0xFFd8dbe0),
                      offset: Offset(1, 1),
                      blurRadius: 20.0,
                    ),
                  ]),
              child: Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
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
                          color: Colors.orange,
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
                          ' + Trần Quang Vũ ',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          ' + 0967218557 ',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          ' + Quảng Ngãi ',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Positioned(
            top: 320,
            child: Container(
              height: 140,
              //width: 50,
              decoration: BoxDecoration(color: Colors.white,
                  //borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, //Color(0xFFd8dbe0),
                      offset: Offset(1, 1),
                      blurRadius: 20.0,
                    ),
                  ]),
              child: Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
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
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'images/' + oder[0].product.ImgUrl)),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Tên sản phẩm: ${oder[0].product.TenSanPham}'),
                                Text('Sô lượng    : ${oder[0].soluong}'),
                                Text('Size        : ${oder[0].product.Size}'),
                                Text('Màu         : ${oder[0].product.Mau}'),
                                Text('Đơn giá     : \$${oder[0].product.Gia}'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 130,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              //offset: Offset(0, -15),
              //blurRadius: 10,
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
                    'Tổng tiền: ',
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
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Thanh toán',
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {},
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
}
