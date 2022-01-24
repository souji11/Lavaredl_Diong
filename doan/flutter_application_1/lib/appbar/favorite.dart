// ignore_for_file: file_names, unused_import, camel_case_types, non_constant_identifier_names, unused_field, prefer_final_fields, unused_element, unnecessary_const, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, empty_statements, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Models/product.dart';

import 'cart.dart';
import 'favorite.dart';
import 'notification.dart';
import '../bottom/account.dart';
import '../bottom/chat.dart';
import '../bottom/home.dart';
import '../bottom/setting.dart';
import '../Navbar.dart';

import 'package:carousel_slider/carousel_slider.dart';
import '../page/product_Tui_Sach.dart';
import '../page/product_detail.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _Favorite_screen createState() => _Favorite_screen();
}

class _Favorite_screen extends State<Favorite>
    with SingleTickerProviderStateMixin {
  Widget currentSceent = Home();
  _ChonTrangSuc1(int index) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: products[index]),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5),
              child: SizedBox(
                height: Curves.easeInOut.transform(1) * 150,
                width: Curves.easeInOut.transform(1) * 3000,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      child: Image(
                        height: 130,
                        width: 150,
                        image: AssetImage(
                          'images/' + products[index].ImgUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 165,
                      top: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${products[index].Gia} VNĐ',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 165,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 5.0),
                          Text(
                            products[index].TenSanPham,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 17.0,
                      right: 10.0,
                      child: Container(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Mua ngay',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                'Sản phẩm yêu thích',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _ChonTrangSuc1(1),
            _ChonTrangSuc1(2),
            _ChonTrangSuc1(0),
            _ChonTrangSuc1(3),
            _ChonTrangSuc1(2),
            _ChonTrangSuc1(1),
            _ChonTrangSuc1(0),
          ],
        ),
      ),
    );
  }
}
