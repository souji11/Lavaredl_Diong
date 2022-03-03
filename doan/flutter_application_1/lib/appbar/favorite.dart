// ignore_for_file: file_names, unused_import, camel_case_types, non_constant_identifier_names, unused_field, prefer_final_fields, unused_element, unnecessary_const, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, empty_statements, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/api/api_giohang_create.dart';
import 'package:flutter_application_1/api/api_yeuthich_index.dart';
import 'package:flutter_application_1/api/api_yeuthich_xoa.dart';
import 'package:provider/provider.dart';
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
  bool _isFavorited = true;
  @override
  Widget build(BuildContext context) {
    Provider.of<ApiYT>(context, listen: false).fetchProduct_YT();
    var api = Provider.of<ApiYT>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Sản phẩm yêu thích",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<ApiYT>(builder: (_, value, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: ListView(
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.all(25),
              //   child: Text(
              //     'Sản phẩm yêu thích',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 30,
              //       fontStyle: FontStyle.italic,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              Container(
                height: 600,
                width: double.infinity,
                child: ListView(
                  // scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics (),
                  addAutomaticKeepAlives: false,
                  children: List.generate(api.lst.length, (index) {
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailScreen(
                                  product: api.lstProduct[index]),
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
                                width: Curves.easeInOut.transform(1) * 400,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 0,
                                      child: Image(
                                        height: 130,
                                        width: 150,
                                        image: AssetImage(
                                          'assets' +
                                              api.lstProduct[index].hinhAnh,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: 165,
                                      top: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${api.lstProduct[index].gia} VNĐ',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(height: 5.0),
                                          Text(
                                            api.lstProduct[index].tenSanPham,
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
                                          onPressed: () {
                                            setState(() {
                                              Provider.of<ApiThemGioHang>(
                                                      context,
                                                      listen: false)
                                                  .ThemGioHang(
                                                      1, api.lst[index].id, 1);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => Cart(),
                                                ),
                                              );
                                            });
                                          },
                                          child: Text(
                                            'Mua ngay',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      bottom: 50,
                                      child: Container(
                                        height: 30,
                                        width: 100,
                                        child: ElevatedButton(
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            backgroundColor: Colors.green,
                                          ),
                                          onPressed: () {
                                            // Provider.of<APIXoaSPYT>(context,
                                            //         listen: false)
                                            //     .XoaSPYT(
                                            //         api.lst[index].idTaiKhoan,
                                            //         api.lst[index].idSanPham);
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (_) => Home(),
                                            //   ),
                                            // );
                                            api.XoaSPYT(
                                                api.lst[index].idTaiKhoan,
                                                api.lst[index].idSanPham);
                                          },
                                          child: Text(
                                            'Xóa',
                                            style: TextStyle(
                                              fontSize: 15,
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
                  }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
