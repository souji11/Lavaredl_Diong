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

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import, unused_element, override_on_non_overriding_member

// import 'dart:ffi';

import 'package:flutter_application_1/Models/Product_main.dart';
import 'package:flutter_application_1/api/api_SapXep.dart';
import 'package:flutter_application_1/api/api_binhluan_index.dart';
import 'package:flutter_application_1/api/api_hoadon.dart';
import 'package:flutter_application_1/api/api_giohang_create.dart';
import 'package:flutter_application_1/api/api_giohang_index.dart';
import 'package:flutter_application_1/api/api_sanpham_giay.dart';
import 'package:flutter_application_1/api/api_sanpham_index.dart';
import 'package:flutter_application_1/api/api_sanpham_ao.dart';
import 'package:flutter_application_1/api/api_sanpham_tui.dart';
import 'package:flutter_application_1/api/api_sanphamyeuthich_them.dart';
import 'package:flutter_application_1/api/api_them_binhluan.dart';
import 'package:flutter_application_1/api/api_yeuthich_index.dart';
import 'package:flutter_application_1/api/api_yeuthich_xoa.dart';
import 'package:flutter_application_1/page/login.dart';
import 'package:flutter_application_1/page/product_detail.dart';
import 'api/api_dangnhap.dart';
import 'api/api_dangky.dart';
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
      ChangeNotifierProvider(create: (_) => Api()),
      ChangeNotifierProvider(create: (_) => Apiao()),
      ChangeNotifierProvider(create: (_) => Apitrangsuc()),
      ChangeNotifierProvider(create: (_) => Apigiay()),
      ChangeNotifierProvider(create: (_) => Apitui()),
      ChangeNotifierProvider(create: (_) => Apidangky()),
      ChangeNotifierProvider(create: (_) => ApiGioHang()),
      ChangeNotifierProvider(create: (_) => ApiThemGioHang()),
      ChangeNotifierProvider(create: (_) => APIThemSPYT()),
      ChangeNotifierProvider(create: (_) => APIXoaSPYT()),
      ChangeNotifierProvider(create: (_) => ApiYT()),
      ChangeNotifierProvider(create: (_) => APIThemCMT()),
      ChangeNotifierProvider(create: (_) => APICMT()),
      ChangeNotifierProvider(create: (_) => ApiSapXep()),
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
      home: Login(),
      debugShowCheckedModeBanner: false,
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

// class DataSearch() extends SearchDelegate{
//   @override
//   buildAction(BuildContext context){
//     throw UnimplementedError();
//   }
//   @override
//   buildLeading(BuildContext context){
//     throw UnimplementedError();
//   }
//   @override
//   buildSugegstions(BuildContext context){
//     throw UnimplementedError();
//   }
//   @override
//   buildResults(BuildContext context){
//     throw UnimplementedError();
//   }
// }
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },

            // color: Colors.green,
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       currentSceent = Notifi();
          //       currentTab = 4;
          //     });
          //   },
          //   icon: const Icon(Icons.notifications_none),
          //   color: currentTab == 4 ? Colors.red : Colors.white,
          // ),
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
              // MaterialButton(
              //   minWidth: 40,
              //   onPressed: () {
              //     setState(() {
              //       currentSceent = Setting();
              //       currentTab = 2;
              //     });
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.settings,
              //         color: currentTab == 2 ? Colors.blue : Colors.green,
              //       ),
              //       Text(
              //         'Cài đặt',
              //         style: TextStyle(
              //             color: currentTab == 2 ? Colors.blue : Colors.green),
              //       ),
              //     ],
              //   ),
              // ),
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

class CustomSearch extends SearchDelegate {
  // List<String>alldata=[
  //   'lalaal','jasj','asjdaj','asd'
  // ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Provider.of<Api>(context, listen: false).fetchProduct_main();
    var api = Provider.of<Api>(context, listen: false);
    List<Product_main> ketQua = [];
    for (var item in api.lst) {
      if (item.tenSanPham.toLowerCase().contains(query.toLowerCase())) {
        ketQua.add(item);
      }
    }
    return ListView.builder(
      itemCount: ketQua.length,
      itemBuilder: (BuildContext context, int index) {
        var resuls = ketQua[index];
        return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ProductDetailScreen(product: api.lstNoiBat[index]),
              ),
            );
          },
          child: Text(resuls.tenSanPham),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Provider.of<Api>(context, listen: false).fetchProduct_main();
    var api = Provider.of<Api>(context, listen: false);
    List<Product_main> ketQua = [];
    for (var item in api.lst) {
      if (item.tenSanPham.toLowerCase().contains(query.toLowerCase())) {
        ketQua.add(item);
      }
    }
    return ListView.builder(
      itemCount: ketQua.length,
      itemBuilder: (BuildContext context, int index) {
        var resuls = ketQua[index];
        return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ProductDetailScreen(product: api.lstNoiBat[index]),
              ),
            );
          },
          child: Text(resuls.tenSanPham),
        );
      },
    );
  }
}
