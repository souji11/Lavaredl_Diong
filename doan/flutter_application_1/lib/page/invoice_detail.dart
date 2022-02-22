// ignore_for_file: deprecated_member_use, unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/order_details.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_cthoadon.dart';
import 'package:provider/provider.dart';
import '../Models/product.dart';
import '../Models/order.dart';

class InvoiceDetail extends StatefulWidget {
  final int number;
  InvoiceDetail(this.number, {Key? key}) : super(key: key);
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    final IdHoaDon = widget.number;
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
          FutureBuilder<List<OrderDetails>>(
              future: fetchCTHoaDon_main(IdHoaDon),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Positioned(
                            top: 320,
                            child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
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
                                        ' Mã đơn hàng: #${snapshot.data![index].IdHoaDon}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ],
                                  )
                                ]))),
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
          FutureBuilder<List<OrderDetails>>(
              future: fetchCTHoaDon_main(IdHoaDon),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Positioned(
                            top: 320,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          ' + ${Auth.user.SDT} ',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          ' + ${Auth.user.DiaChi1} ',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
          FutureBuilder<List<OrderDetails>>(
              future: fetchCTHoaDon_main(IdHoaDon),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Positioned(
                            top: 320,
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
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
                                                // image: DecorationImage(
                                                // fit: BoxFit.cover,
                                                // image: AssetImage(images/' + oder[0].product.ImgUrl)
                                                // ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text(
                                                //     'Tên sản phẩm: ${oder[0].product.TenSanPham}'),
                                                // Text('Sô lượng    : ${oder[0].soluong}'),
                                                // Text('Size        : ${oder[0].product.Size}'),
                                                // Text('Màu         : ${oder[0].product.Mau}'),
                                                // Text('Đơn giá     : \$${oder[0].product.Gia}'),
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
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              })
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
