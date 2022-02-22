// //import 'dart:html';
// // ignore_for_file: unused_import
// import 'Pages/products.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'Models/Product.dart';

// void main() => runApp(const MyApp());
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return MaterialApp(
//       title: 'DO AN ',
//       debugShowCheckedModeBanner: false,
//       home: const ProductScreen(),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'package:flutter_application_1/Models/Product_main.dart';
import 'package:flutter_application_1/api/api_sanpham_giay.dart';
import 'package:flutter_application_1/api/api_sanpham_index.dart';
import 'package:flutter_application_1/api/api_sanpham_ao.dart';
import 'package:flutter_application_1/api/api_sanpham_tui.dart';
import 'package:flutter_application_1/api/api_sanphamyeuthich_them.dart';
import 'package:flutter_application_1/api/api_yeuthich_index.dart';
import 'package:flutter_application_1/api/api_yeuthich_xoa.dart';
import 'package:provider/provider.dart';

import 'api/api_sanpham_trangsuc.dart';
import 'appbar/appbar_main.dart';
import 'package:flutter/material.dart';
import 'appbar/cart.dart';
import 'appbar/favorite.dart';
import 'appbar/notification.dart';
import 'bottom/account.dart';
import 'bottom/chat.dart';
import 'bottom/home.dart';
import 'bottom/setting.dart';
import 'Navbar.dart';
import 'Models/product.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Api(), 
      ),
      ChangeNotifierProvider(create: (_)=>Apiao()),
      ChangeNotifierProvider(create: (_)=>Apitrangsuc()),
      ChangeNotifierProvider(create: (_)=>Apigiay()),
      ChangeNotifierProvider(create: (_)=>Apitui()),
      ChangeNotifierProvider(create: (_)=>APIThemSPYT()),
      ChangeNotifierProvider(create: (_)=>APIXoaSPYT()),
      ChangeNotifierProvider(create: (_)=>ApiYT()),
    ],
    
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GUCCI',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTab = 0;

 
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentSceent = Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
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
      body: PageStorage(
        bucket: bucket,
        child: currentSceent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                      'Trang chủ',
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
                    // currentSceent = Chat();
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
                      'Trò chuyện',
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
                      'Cài đặt',
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
                      'Tài khoản',
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
