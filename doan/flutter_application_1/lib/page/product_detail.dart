//import 'dart:html';
// ignore_for_file: unused_import, file_names, prefer_const_constructors, sized_box_for_whitespace

import '../appbar/cart.dart';
import '../appbar/favorite.dart';
import '../appbar/notification.dart';
import '../bottom/account.dart';
import '../bottom/chat.dart';
import '../bottom/home.dart';
import '../bottom/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Models/product.dart';
import '../Navbar.dart';
import 'cmt.dart';
// import '../Page/products.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentTab = 0;
  String dropdownValueSize = 'Kích cỡ';
  String dropdownValueMau = 'Màu';
  late String valuechoose;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentSceent = Home();

  List listmau = ["Xanh", "Đỏ", "Tím", "Vàng"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        // title: Text(
        //   widget.title,
        //   style: const TextStyle(color: Colors.white),
        // ),
        // leading: IconButton(
        // icon: const Icon(Icons.menu),
        //  color: Colors.green,
        // onPressed: () {},
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            // color: Colors.green,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentSceent = Notifi();
                currentTab = 4;
              });
            },
            icon: const Icon(Icons.notifications_none),
            color: currentTab == 4 ? Colors.red : Colors.white,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentSceent = Favorite();
                currentTab = 5;
              });
            },
            icon: const Icon(Icons.favorite),
            color: currentTab == 5 ? Colors.red : Colors.white,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentSceent = Cart();
                currentTab = 6;
              });
            },
            icon: const Icon(Icons.shopping_cart),
            color: currentTab == 6 ? Colors.red : Colors.white,
          )
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    // margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 60.0,
                    ),
                    color: Colors.greenAccent,

                    child: SizedBox(
                      height: Curves.easeInOut.transform(1) * 500,
                      width: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          // Hình sản phẩn
                          Positioned(
                            right: 50,
                            left: 50,
                            child: Image(
                              height: 400,
                              width: 400,
                              image: AssetImage(
                                'images/' + widget.product.ImgUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Giá sản phẩm
                          Positioned(
                            bottom: 5,
                            left: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${widget.product.Gia} VNĐ',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Tên sản phẩm
                          Positioned(
                            bottom: 50,
                            left: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 5.0),
                                Text(
                                  widget.product.TenSanPham,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //chọn màu
                          Positioned(
                            right: 50,
                            bottom: 5,
                            child: Container(
                              height: 30,
                              width: 150,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValueMau,
                                dropdownColor: Colors.pink[50],
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 30,
                                isExpanded: true,
                                elevation: 16,
                                style: const TextStyle(
                                  color: Colors.deepPurple,
                                ),
                                underline: SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValueMau = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Màu',
                                  'Xanh',
                                  'Đỏ',
                                  'Tím',
                                  'Vàng'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          // chọn size
                          Positioned(
                            bottom: 50,
                            right: 50,
                            child: Container(
                              height: 30,
                              width: 150,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButton(
                                dropdownColor: Colors.pink[50],
                                underline: SizedBox(),
                                value: dropdownValueSize,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 30,
                                isExpanded: true,
                                elevation: 16,
                                style: const TextStyle(
                                  color: Colors.deepPurple,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValueSize = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Kích cỡ',
                                  'M',
                                  'L',
                                  'S',
                                  'XL'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   right: 10,
                    //   bottom: 100,
                    //   top: 10,
                    //   left: 10,
                    //   child: Hero(
                    //     tag: widget.product.ImgUrl,
                    //     child: Image(
                    //       height: 200,
                    //       width: 200,
                    //       image: AssetImage(
                    //           'assets/images/' + widget.product.ImgUrl),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(50),
                height: 400.0,
                transform: Matrix4.translationValues(0, -20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Mua ngay (chưa có trang thanh toán)
                    Container(
                      height: 80,
                      width: 1000,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            child: FavoriteWidget(),
                          ),
                          Positioned(
                            left: 450,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Home(),
                                  ),
                                );
                              },
                              child: Text(
                                'Mua ngay',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          // Bình luận chưa gắn vào
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PageBinhLuan()));
                              },
                              child: Text(
                                'Bình luận',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 50,
                      width: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.yellow,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Home(),
                                  ),
                                );
                              },
                              child: Text(
                                'Thêm vào giỏ hàng',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 40.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Mô tả sản phẩm',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            widget.product.Mota,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 40.0,
                      ),
                    ),

                    //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentSceent = Home();
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: currentTab == 0 ? Colors.blue : Colors.green,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: currentTab == 0 ? Colors.blue : Colors.green),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentSceent = Chat();
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message,
                      color: currentTab == 1 ? Colors.blue : Colors.green,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                          color: currentTab == 1 ? Colors.blue : Colors.green),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentSceent = Setting();
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: currentTab == 2 ? Colors.blue : Colors.green,
                    ),
                    Text(
                      'Setting',
                      style: TextStyle(
                          color: currentTab == 2 ? Colors.blue : Colors.green),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentSceent = AccountS();
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.manage_accounts,
                      color: currentTab == 3 ? Colors.blue : Colors.green,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: currentTab == 3 ? Colors.blue : Colors.green),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
