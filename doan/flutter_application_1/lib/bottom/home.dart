// ignore_for_file: non_constant_identifier_names, unused_import, prefer_const_constructors_in_immutables, duplicate_import, prefer_const_constructors, sized_box_for_whitespace, unused_field, prefer_final_fields, avoid_unnecessary_containers, unnecessary_new, unnecessary_string_interpolations, unused_local_variable
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Models/Product_main.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_sanpham_index.dart';
import 'package:flutter_application_1/api/api_sanphamyeuthich_them.dart';
import 'package:flutter_application_1/api/api_yeuthich_xoa.dart';
import 'package:flutter_application_1/appbar/cart.dart';
import 'package:flutter_application_1/appbar/favorite.dart';
import 'package:flutter_application_1/bottom/account.dart';
import 'package:provider/provider.dart';
import '../Navbar.dart';
import '../main.dart';
import '../page/product_Ao_Quan.dart';
import '../page/product_Giay_Dep.dart';
import '../page/product_Trang_Suc.dart';
import '../page/product_Tui_Sach.dart';
import '../page/product_detail.dart';
import '../page/product_detail.dart';
import '../page/product_Tui_Sach.dart';
import '../Models/product.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class FavoriteWidget extends StatefulWidget {
  final Product_main product;
  const FavoriteWidget({Key? key, required this.product}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    // Provider.of<Api>(context, listen: false).fetchProduct_main();
    // Provider.of<APIThemSPYT>(context, listen: false).ThemSPyeuthich(1, widget.product.id);
    var apithem = Provider.of<APIThemSPYT>(context, listen: false);
    var apixoa = Provider.of<APIXoaSPYT>(context, listen: false);
    // return Scaffold(body: Consumer<APIThemSPYT>(
    // builder: (_, value, child) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border)),
            color: Colors.red[500],
            iconSize: 30,
            // onPressed: _toggleFavorite,
            onPressed: () => setState(() {
              if (_isFavorited) {
                // apithem.ThemSPyeuthich(1, widget.product.id);
                apixoa.XoaSPYT(widget.product);
                _isFavorited = false;
              } else {
                // Provider.of<APIThemSPYT>(context, listen: false)
                //     .ThemSPyeuthich(1, widget.product.id);
                apithem.ThemSPyeuthich(Auth.user.id, widget.product.id);
                _isFavorited = true;
              }
            }),
          ),
        ),
      ],
    );
    //   },
    // ));
  }

  // void _toggleFavorite() {
  //   setState(() {
  //     if (_isFavorited) {
  //       _isFavorited = false;
  //       Provider.of<APIThemSPYT>(context, listen: false).ThemSPyeuthich(1, 2);
  //     } else {
  //       _isFavorited = true;
  //     }
  //   });
  // }
  // ···
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedPage = 0;int currentTab = 0;Widget currentSceent = Home();
  @override
  Widget build(BuildContext contextq) {
    Provider.of<Api>(context, listen: false).fetchProduct_main();
    Provider.of<Api>(context, listen: false).fetchProduct_BanChay();
    Provider.of<Api>(context, listen: false).fetchProduct_NoiBat();
    Provider.of<Api>(context, listen: false).fetchProduct_Moi();
    var api = Provider.of<Api>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      //  appBar: AppBar(),
      body: Consumer<Api>(
        builder: (_, value, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration:
                        const Duration(microseconds: 1000),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    Banner('images/anh1.jpg'),
                    Banner('images/anh2.jpeg'),
                    Banner('images/anh3.jpg')
                  ],
                ),
                // nút phân loại
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.black,
                        //     width: 2,
                        //   ),
                        // ),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Product_AoQuan_screen(),
                              ),
                            );
                          },
                          child: Text(
                            'Áo-Quần',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Product_TrangSuc_screen(),
                              ),
                            );
                          },
                          child: Text(
                            'Trang Sức',
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
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.yellow,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Product_GiayDep_screen(),
                              ),
                            );
                          },
                          child: Text(
                            'Giày - dép   ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.pink,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Product_TuiSach_screen(),
                              ),
                            );
                          },
                          child: Text(
                            'Túi Xách',
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
// xuất ra sản phẩm mới
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Sản phẩm mới',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(api.lstMoi.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductDetailScreen(
                                    product: api.lstMoi[index]),
                              ),
                            );
                          },
                          child: Consumer<Api>(
                            builder: (_, value, child) {
                              return Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: SizedBox(
                                      height:
                                          Curves.easeInOut.transform(1) * 440.0,
                                      width:
                                          Curves.easeInOut.transform(1) * 100,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            child: Image(
                                              height: 150,
                                              width: 100,
                                              image: AssetImage(
                                               'assets'+api.lstMoi[index].hinhAnh),
                                              fit: BoxFit.cover,
                                            ),
                                            // child: Image.network('http://' + api.lst[index].hinhAnh),
                                          ),
                                          Positioned(
                                            left: 10.0,
                                            bottom: 0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${api.lstMoi[index].gia} VNĐ',
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
                                            bottom: 20.0,
                                            left: 10.0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const SizedBox(height: 5.0),
                                                Text(
                                                  api.lstMoi[index].tenSanPham,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ),
// xuất ra sản phẩm nổi bật
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Sản phẩm nổi bật',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(api.lstNoiBat.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductDetailScreen(
                                    product: api.lstNoiBat[index]),
                              ),
                            );
                          },
                          child: Consumer<Api>(
                            builder: (_, value, child) {
                              return Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: SizedBox(
                                      height:
                                          Curves.easeInOut.transform(1) * 440.0,
                                      width:
                                          Curves.easeInOut.transform(1) * 100,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            child: Image(
                                              height: 150,
                                              width: 100,
                                              // image: NetworkImage('http://192.168.1.9:8000${api.lst[index].hinhAnh}'),
                                               image: AssetImage(
                                               'assets'+api.lstNoiBat[index].hinhAnh),
                                              //  image: AssetImage(
                                              //     'images/' + api.lst[index].hinhAnh,
                                              //   ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            left: 10.0,
                                            bottom: 0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${api.lstNoiBat[index].gia} VNĐ',
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
                                            bottom: 20.0,
                                            left: 10.0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const SizedBox(height: 5.0),
                                                Text(
                                                  api.lstNoiBat[index].tenSanPham,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ),
// xuất ra sản phẩm Bán chạy
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Sản phẩm bán chạy',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(api.lstBanChay.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductDetailScreen(
                                    product: api.lstBanChay[index]),
                              ),
                            );
                          },
                          child: Consumer<Api>(
                            builder: (_, value, child) {
                              return Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: SizedBox(
                                      height:
                                          Curves.easeInOut.transform(1) * 440.0,
                                      width:
                                          Curves.easeInOut.transform(1) * 100,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            child: Image(
                                              height: 150,
                                              width: 100,
                                              // image: NetworkImage('http://192.168.1.9:8000${api.lst[index].hinhAnh}'),
                                               image: AssetImage(
                                               'assets'+api.lstBanChay[index].hinhAnh),
                                              //  image: AssetImage(
                                              //     'images/' + api.lst[index].hinhAnh,
                                              //   ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            left: 10.0,
                                            bottom: 0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${api.lstBanChay[index].gia} VNĐ',
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
                                            bottom: 20.0,
                                            left: 10.0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const SizedBox(height: 5.0),
                                                Text(
                                                  api.lstBanChay[index].tenSanPham,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
       
    );
  }

  Container Banner(String link) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(link),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
