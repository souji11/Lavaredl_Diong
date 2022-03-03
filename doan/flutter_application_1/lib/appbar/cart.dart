// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, unused_import, avoid_web_libraries_in_flutter, unnecessary_brace_in_string_interps, unused_local_variable, non_constant_identifier_names

// import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_giohang_index.dart';
import 'package:flutter_application_1/page/payment2.dart';
// import 'package:flutter_application_1/api/api_sanpham_index.dart';
import 'package:provider/provider.dart';

import '../Models/cart.dart';
import '../Models/product.dart';
import '../page/payment.dart';
//import 'package:flutter_application_3/Models/product.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ApiGioHang>(context, listen: false).fetchgiohang();
    var api = Provider.of<ApiGioHang>(context, listen: false);
    return Consumer<ApiGioHang>(
      builder: (_, value, __) {
        return Scaffold(
          appBar: Appbar(context),
          body: Stack(
            children: [
              Container(),
              Positioned.fill(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(16),
                    itemCount: api.lst.length,
                    itemBuilder: (context, index) => Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                child: Image(
                                  image: AssetImage(
                                      'assets' + api.lst[index].hinhAnh),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    api.lst[index].tenSanPham,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('${api.lst[index].gia}'),
                                  Text(api.lst[index].Tenmau),
                                  Text(api.lst[index].tenSize),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      api.Tru(api.lst[index].idTaiKhoan,
                                          api.lst[index].idSanPham);
                                    },
                                    child: Container(
                                      color: Colors.grey,
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('${api.lst[index].so_Luong}'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      api.Cong(api.lst[index].idTaiKhoan,
                                          api.lst[index].idSanPham);
                                    },
                                    child: Container(
                                      color: Colors.grey,
                                      child: Icon(Icons.add),
                                    ),
                                  )
                                ],
                              ),
                              // ElevatedButton.icon(
                              //   onPressed: () {},
                              //   icon: Icon(Icons.delete),
                              //   label: Text,
                              // )
                              SizedBox(
                                width: 30,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      api.XoaGioHang(api.lst[index].idTaiKhoan,
                                          api.lst[index].idSanPham);
                                      api.fetchgiohang();
                                    });
                                  },
                                  child: Icon(Icons.delete))
                            ],
                          ),
                        )),
              ),
              Consumer<ApiGioHang>(builder: (_, value, child) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Tổng tiền : ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${api.total}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32, vertical: 16.0),
                                      primary: Colors.green,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side: BorderSide(
                                              color: Colors.black38))),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => Payment2(),
                                      ),
                                    );
                                  },
                                  child: Text('Thanh Toán')),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        );
      },
    );
  }
}

AppBar Appbar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.green,
    title: Column(
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Giỏ hàng",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

// class Cart extends StatefulWidget {
//   const Cart({Key? key}) : super(key: key);

//   @override
//   _CartState createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Appbar(context),
//       body: const Body(),
//       bottomNavigationBar: CheckOutCart(),
//     );
//   }

//   AppBar Appbar(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       backgroundColor: Colors.green,
//       title: Column(
//         //crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             "Giỏ hàng",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CheckOutCart extends StatelessWidget {
//   const CheckOutCart({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Provider.of<ApiGioHang>(context, listen: false).fetchgiohang();
//     var api = Provider.of<ApiGioHang>(context, listen: false);
//     // return Container(
//     //     height: 130,
//     //     decoration: BoxDecoration(color: Colors.white, boxShadow: [
//     //       BoxShadow(
//     //           offset: Offset(0, -15),
//     //           blurRadius: 20,
//     //           color: Color(0xFFDADADA).withOpacity(0.15)),
//     //     ]),
//     //     child: Consumer<ApiGioHang>(
//     //       builder: (_, value, child) {
//     //         return Container(
//     //           decoration: BoxDecoration(),
//     //         );
//     //       },
//     //     )
//     //     );
//     return Consumer<ApiGioHang>(builder: (_, value, child) {
//       return SizedBox(
//         height: 60,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Giá :${api.total}đ'),
//             SizedBox(
//               width: 50,
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => Payment2(),
//                   ),
//                 );
//               },
//               child: Container(
//                 width: 200,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.green,
//                 ),
//                 child: Center(
//                   child: Text('Thanh toán'),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
// }

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<ApiGioHang>(context, listen: false).fetchgiohang();
//     var api = Provider.of<ApiGioHang>(context, listen: false);
//     // print(api.lst[].gia);

  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child: Consumer<ApiGioHang>(builder: (_, value, child) {
  //       return ListView.builder(
  //           itemCount: api.lst.length,
  //           itemBuilder: (context, index) => Padding(
  //                 padding: EdgeInsets.symmetric(vertical: 10),
  //                 child: 
  //                 Dismissible(
  //                     key: Key(api.lst[index].id.toString()),
  //                     direction: DismissDirection.startToEnd,
  //                     background: Container(
  //                       padding: EdgeInsets.symmetric(horizontal: 20),
  //                       decoration: BoxDecoration(
  //                         color: Color(0xFFFFE6E6),
  //                         borderRadius: BorderRadius.circular(15),
  //                       ),
  //                       child: Row(
  //                         children: [
  //                           Icon(
  //                             Icons.delete_outline,
  //                             color: Colors.red,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     onDismissed: (direction) {
  //                       setState(() {
  //                         //cart.removeAt(index);
  //                         api.XoaGioHang(api.lst[index].idTaiKhoan,
  //                             api.lst[index].idSanPham);
  //                       });
  //                     },
  //                     child: CartItem(
  //                         api.lst[index].hinhAnh,
  //                         api.lst[index].tenSanPham,
  //                         api.lst[index].gia,
  //                         api.lst[index].so_Luong,
  //                         api.lst[index].tenSize,
  //                         api.lst[index].Tenmau)),
  //               ));
  //     }),
  //   );
  // }

// //   // ignore: non_constant_identifier_names
//   Row CartItem(
//       String link, String Ten, int gia, int soluong, String size, String mau) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 100,
//           height: 100,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child:
//                     //Image.asset('images/' + cart[index].product.ImgUrl),
//                     Image(
//                   image: AssetImage('assets' + link),
//                 )),
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               Ten,
//               style: TextStyle(fontSize: 16, color: Colors.black),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text.rich(
//               TextSpan(
//                   text: "\$${gia}",
//                   style: TextStyle(color: Colors.green),
//                   children: [
//                     TextSpan(
//                       text: " x ${soluong}",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ]),
//             ),
//             Text("Size: " + size),
//             Text("Màu: " + mau),
//           ],
//         ),
//       ],
//     );
//   }
// }
