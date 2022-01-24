// ignore_for_file: deprecated_member_use

// import 'dart:ffi';

import 'package:flutter/material.dart';
// ignore: unused_import
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
          Text(
            "${cart.length} sản phẩm",
            //textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          )
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
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.receipt,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 180,
              ),
              Text("Nhập mã voucher"),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Colors.black,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Giá tiền"),
                  SizedBox(
                    height: 5,
                  ),
                  Text('\$3000')
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(cart[index].product.ID.toString()),
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
                      cart.removeAt(index);
                    });
                  },
                  child: CartItem(index),
                ),
              )),
    );
  }

  Row CartItem(int index) {
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
              child: Image.asset('images/' + cart[index].product.ImgUrl),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart[index].product.TenSanPham,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: "\$${cart[index].product.Gia}",
                  style: TextStyle(color: Colors.green),
                  children: [
                    TextSpan(
                      text: " x ${cart[index].soluong}",
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
