// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, unused_import, avoid_web_libraries_in_flutter, unnecessary_brace_in_string_interps, unused_local_variable, non_constant_identifier_names

// import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_giohang_index.dart';
import 'package:flutter_application_1/api/api_sanpham_index.dart';
import 'package:provider/provider.dart';

import '../Models/cart.dart';
import '../Models/product.dart';
import '../page/payment.dart';
//import 'package:flutter_application_3/Models/product.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(context),
      body: const Body(),
      bottomNavigationBar: CheckOutCart(),
    );
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
}

class CheckOutCart extends StatelessWidget {
  const CheckOutCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ApiGioHang>(context, listen: false).fetchProduct_main();
    var api = Provider.of<ApiGioHang>(context, listen: false);
    return Container(
      height: 130,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15)),
      ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text("Giá tiền"),
                  SizedBox(
                    height: 5,
                  ),
                  Text('\$')
                ],
              ),
              SizedBox(
                width: 190,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageThanhToan()),
                    );
                  },
                  color: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Thanh toán',
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ApiGioHang>(context, listen: false).fetchProduct_main();
    var api = Provider.of<ApiGioHang>(context, listen: false);
    // print(api.lst[].gia);
    print('aksdkasd');
    return Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer<ApiGioHang>(builder: (_, value, child) {
        return ListView.builder(
            itemCount: api.lst.length,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                      key: Key(api.lst[index].id.toString()),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          //cart.removeAt(index);
                          api.XoaGioHang(api.lst[index].idTaiKhoan,
                              api.lst[index].idSanPham);
                        });
                      },
                     
                      child: CartItem(
                          api.lst[index].hinhAnh,
                          api.lst[index].tenSanPham,
                          api.lst[index].gia,
                          api.lst[index].so_Luong)),
                ));
      }),
    );
  }

  // ignore: non_constant_identifier_names
  Row CartItem(String link, String Ten, int gia, int soluong) {
    
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                    //Image.asset('images/' + cart[index].product.ImgUrl),
                    Image(
                  image: NetworkImage(link),
                )),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Ten,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: "\$${gia}",
                  style: TextStyle(color: Colors.green),
                  children: [
                    TextSpan(
                      text: " x ${soluong}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
