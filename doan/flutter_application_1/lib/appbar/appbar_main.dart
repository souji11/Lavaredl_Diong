// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors

import 'cart.dart';
import '../bottom/home.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
import '../Models/Product.dart';

import 'favorite.dart';

class AppBar_Main extends StatefulWidget {
  const AppBar_Main({Key? key}) : super(key: key);

  @override
  _AppBar_MainState createState() => _AppBar_MainState();
}

class _AppBar_MainState extends State<AppBar_Main> {
  int currentTab = 0;

  //final List<Widget> screent = [
  //const Home(),
  //const Chat(),
  // const Setting(),
  //const Account(),
  //const Favorite(),
  //const Cart(),
  //const Notifi(),
  //];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentSceent = Home();
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        TextButton(
          child: Text('home'),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Home(),
              ),
            );
          },
        ),
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
    );
  }
}
