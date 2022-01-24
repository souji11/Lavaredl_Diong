import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Models/order.dart';
import 'login.dart';
import 'payment2.dart';

class PageThanhToan extends StatefulWidget {
  const PageThanhToan({Key? key}) : super(key: key);

  @override
  _PageThanhToan createState() => _PageThanhToan();
}

class _PageThanhToan extends State<PageThanhToan> {
  bool isVisible = false;
  int value = 0;
  final paymentLabels = [
    'Thanh toán sau khi nhận hàng',
    'Momo',
    'ZaloPay',
    'VisaPay',
    'PayPal',
  ];

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
              "Thanh toán",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Column(
            children: [
              SizedBox(
                height: 30,
                width: 300,
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green[400],
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  label: const Text(
                    "Hiên/ Ẩn danh sách sản phẩm",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(Icons.list_alt_rounded),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Column(
                  children: [
                    Container(
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
                                          image: AssetImage('images/' +
                                              oder[0].product.ImgUrl)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Tên sản phẩm: ${oder[0].product.TenSanPham}'),
                                      Text('Sô lượng    : ${oder[0].soluong}'),
                                      Text(
                                          'Size        : ${oder[0].product.Size}'),
                                      Text(
                                          'Màu         : ${oder[0].product.Mau}'),
                                      Text(
                                          'Đơn giá     : \$${oder[0].product.Gia}'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
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
                                          image: AssetImage('images/' +
                                              oder[0].product.ImgUrl)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Tên sản phẩm: ${oder[0].product.TenSanPham}'),
                                      Text('Sô lượng    : ${oder[0].soluong}'),
                                      Text(
                                          'Size        : ${oder[0].product.Size}'),
                                      Text(
                                          'Màu         : ${oder[0].product.Mau}'),
                                      Text(
                                          'Đơn giá     : \$${oder[0].product.Gia}'),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
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
                                          image: AssetImage('images/' +
                                              oder[0].product.ImgUrl)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Tên sản phẩm: ${oder[0].product.TenSanPham}'),
                                      Text('Sô lượng    : ${oder[0].soluong}'),
                                      Text(
                                          'Size        : ${oder[0].product.Size}'),
                                      Text(
                                          'Màu         : ${oder[0].product.Mau}'),
                                      Text(
                                          'Đơn giá     : \$${oder[0].product.Gia}'),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
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
                                          image: AssetImage('images/' +
                                              oder[0].product.ImgUrl)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Tên sản phẩm: ${oder[0].product.TenSanPham}'),
                                      Text('Sô lượng    : ${oder[0].soluong}'),
                                      Text(
                                          'Size        : ${oder[0].product.Size}'),
                                      Text(
                                          'Màu         : ${oder[0].product.Mau}'),
                                      Text(
                                          'Đơn giá     : \$${oder[0].product.Gia}'),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
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
                                          image: AssetImage('images/' +
                                              oder[0].product.ImgUrl)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Tên sản phẩm: ${oder[0].product.TenSanPham}'),
                                      Text('Sô lượng    : ${oder[0].soluong}'),
                                      Text(
                                          'Size        : ${oder[0].product.Size}'),
                                      Text(
                                          'Màu         : ${oder[0].product.Mau}'),
                                      Text(
                                          'Đơn giá     : \$${oder[0].product.Gia}'),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
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
                                          image: AssetImage('images/' +
                                              oder[0].product.ImgUrl)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Tên sản phẩm: ${oder[0].product.TenSanPham}'),
                                      Text('Sô lượng    : ${oder[0].soluong}'),
                                      Text(
                                          'Size        : ${oder[0].product.Size}'),
                                      Text(
                                          'Màu         : ${oder[0].product.Mau}'),
                                      Text(
                                          'Đơn giá     : \$${oder[0].product.Gia}'),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Tổng tiền: \$10000'),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, right: 50, left: 50),
            child: SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green[400],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Payment2()));
                },
                label: const Text(
                  "Thanh toán sau khi nhận hàng",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.payment),
              ),
            ),
          ),
          // Divider(
          //   color: Colors.grey,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Material(
          //           elevation: 8,
          //           borderRadius: BorderRadius.circular(28),
          //           clipBehavior: Clip.antiAliasWithSaveLayer,
          //           child: InkWell(
          //             splashColor: Colors.black26,
          //             onTap: () {},
          //             child: Column(
          //               children: [
          //                 Ink.image(
          //                   image: AssetImage('images/momo2.png'),
          //                   height: 50,
          //                   width: 100,
          //                   fit: BoxFit.cover,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(padding: EdgeInsets.all(5)),
          //       Expanded(
          //         child: Material(
          //           elevation: 8,
          //           borderRadius: BorderRadius.circular(28),
          //           clipBehavior: Clip.antiAliasWithSaveLayer,
          //           child: InkWell(
          //             splashColor: Colors.black26,
          //             onTap: () {},
          //             child: Column(
          //               children: [
          //                 Ink.image(
          //                   image: AssetImage('images/zalopay.jpg'),
          //                   height: 50,
          //                   width: 100,
          //                   fit: BoxFit.cover,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(padding: EdgeInsets.all(5)),
          //       Expanded(
          //         child: Material(
          //           elevation: 8,
          //           borderRadius: BorderRadius.circular(28),
          //           clipBehavior: Clip.antiAliasWithSaveLayer,
          //           child: InkWell(
          //             splashColor: Colors.black26,
          //             onTap: () {},
          //             child: Column(
          //               children: [
          //                 Ink.image(
          //                   image: AssetImage('images/paypal2.png'),
          //                   height: 50,
          //                   width: 100,
          //                   fit: BoxFit.cover,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(padding: EdgeInsets.all(5)),
          //       Expanded(
          //         child: Material(
          //           elevation: 8,
          //           borderRadius: BorderRadius.circular(28),
          //           clipBehavior: Clip.antiAliasWithSaveLayer,
          //           child: InkWell(
          //             splashColor: Colors.black26,
          //             onTap: () {},
          //             child: Column(
          //               children: [
          //                 Ink.image(
          //                   image: AssetImage('images/visa.png'),
          //                   height: 50,
          //                   width: 100,
          //                   fit: BoxFit.cover,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
