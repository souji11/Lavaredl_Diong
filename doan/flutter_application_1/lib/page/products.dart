// ignore_for_file: unused_import, unused_field, prefer_final_fields, unused_element, avoid_print, sized_box_for_whitespace, prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

// import 'dart:html';

import 'product_Tui_Sach.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Models/product.dart';
import 'product_detail.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
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

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late PageController _SanPhamMoi;
  late PageController _SanPhamNoiBat;
  late PageController _SanPhamBanChay;

  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();

    _SanPhamMoi = PageController(initialPage: 0, viewportFraction: 0.8);
    _SanPhamBanChay = PageController(initialPage: 0, viewportFraction: 0.8);
    _SanPhamNoiBat = PageController(initialPage: 0, viewportFraction: 0.8);
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Icon(
                    Icons.menu,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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
