// ignore_for_file: non_constant_identifier_names, unused_import, prefer_const_constructors_in_immutables, duplicate_import, prefer_const_constructors, sized_box_for_whitespace, unused_field, prefer_final_fields, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import '../page/product_Ao_Quan.dart';
import '../page/product_Giay_Dep.dart';
import '../page/product_Trang_Suc.dart';
import '../page/product_Tui_Sach.dart';
import '../page/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Models/product.dart';
import '../page/product_detail.dart';
import '../page/product_Tui_Sach.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.favorite_border)
                : const Icon(Icons.favorite)),
            color: Colors.red[500],
            iconSize: 30,
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
  // ···
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
  }

  _ChonSanPhamMoi(int index) {
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
                height: Curves.easeInOut.transform(1) * 440.0,
                width: Curves.easeInOut.transform(1) * 100,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      child: Image(
                        height: 150,
                        width: 100,
                        image: AssetImage(
                          'images/' + products[index].ImgUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      bottom: 0,
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
                      bottom: 20.0,
                      left: 10.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 5.0),
                          Text(
                            products[index].TenSanPham,
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
        ),
      ),
    );
  }

  _ChonSanPhamBanChay(int index) {
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
                height: Curves.easeInOut.transform(1) * 440.0,
                width: Curves.easeInOut.transform(1) * 100,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      child: Image(
                        height: 150,
                        width: 100,
                        image: AssetImage(
                          'images/' + products[index].ImgUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      bottom: 0,
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
                      bottom: 20.0,
                      left: 10.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 5.0),
                          Text(
                            products[index].TenSanPham,
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
        ),
      ),
    );
  }

  _ChonSanPhamNoiBat(int index) {
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
                height: Curves.easeInOut.transform(1) * 440.0,
                width: Curves.easeInOut.transform(1) * 100,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      child: Image(
                        height: 150,
                        width: 100,
                        image: AssetImage(
                          'images/' + products[index].ImgUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      bottom: 0,
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
                      bottom: 20.0,
                      left: 10.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 5.0),
                          Text(
                            products[index].TenSanPham,
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
                autoPlayAnimationDuration: const Duration(microseconds: 1000),
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
            //
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
                        'Giày - dép',
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
                        'Túi Sách',
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
              padding: EdgeInsets.all(15),
              child: Text(
                'Sản phẩm mới',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // xuất ra sản phẩm mới
            Container(
              height: 200,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _ChonSanPhamMoi(0),
                  _ChonSanPhamMoi(1),
                  _ChonSanPhamMoi(2),
                  _ChonSanPhamMoi(3),
                  _ChonSanPhamMoi(1),
                  _ChonSanPhamMoi(3),
                  _ChonSanPhamMoi(2),
                  _ChonSanPhamMoi(0),
                  _ChonSanPhamMoi(3),
                  _ChonSanPhamMoi(1),
                ],
              ),
            ),
            // Hết
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

            // xuất ra sản phẩm nổi bật
            Container(
              height: 200,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _ChonSanPhamNoiBat(0),
                  _ChonSanPhamNoiBat(1),
                  _ChonSanPhamNoiBat(2),
                  _ChonSanPhamNoiBat(3),
                  _ChonSanPhamNoiBat(1),
                  _ChonSanPhamNoiBat(3),
                  _ChonSanPhamNoiBat(2),
                  _ChonSanPhamNoiBat(0),
                  _ChonSanPhamNoiBat(3),
                  _ChonSanPhamNoiBat(1),
                ],
              ),
            ),
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

            // xuất ra sản phẩm Bán chạy
            Container(
              height: 200,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _ChonSanPhamBanChay(0),
                  _ChonSanPhamBanChay(1),
                  _ChonSanPhamBanChay(2),
                  _ChonSanPhamBanChay(3),
                  _ChonSanPhamBanChay(1),
                  _ChonSanPhamBanChay(3),
                  _ChonSanPhamBanChay(2),
                  _ChonSanPhamBanChay(0),
                  _ChonSanPhamBanChay(3),
                  _ChonSanPhamBanChay(1),
                ],
              ),
            ),
          ],
        ),
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
