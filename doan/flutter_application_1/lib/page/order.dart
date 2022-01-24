import 'package:flutter/material.dart';
import '../Models/product.dart';
import '../Models/order.dart';
import 'invoice_detail.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int active = 0;
  List menu = [
    'Tất cả',
    'Đơn mới đặt',
    'Đơn đã xử lý',
    'Đơn đang vận chuyển',
    'Đơn đã hoàn thành',
    'Đơn đã hủy',
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
              "Đơn hàng",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: List.generate(menu.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          active = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: active == index
                                      ? Colors.black
                                      : Colors.white,
                                  width: 2)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            menu[index],
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          invoice(0),
          SizedBox(
            height: 10,
          ),
          invoice(1),
          SizedBox(
            height: 10,
          ),
          invoice(2),
        ],
      ),
    );
  }

  Positioned invoice(int index) {
    return Positioned(
      top: 320,
      child: Container(
        height: 60,
        width: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey, //Color(0xFFd8dbe0),
                offset: Offset(1, 1),
                blurRadius: 20.0,
              ),
            ]),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${oder[index].code}',
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
                    oder[index].trangthai,
                    style: TextStyle(fontSize: 16, color: Colors.orange),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InvoiceDetail()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
              //const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
