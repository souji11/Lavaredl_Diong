// ignore_for_file: prefer_const_constructors_in_immutables, avoid_returning_null_for_void, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'page/login.dart';
import 'page/register.dart';

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Trần Quang Vũ'),
            accountEmail: const Text('vutran.300101@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/anh.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image:  NetworkImage(
                    'https://staticproxy.mytourcdn.com/480x360,q90/resources/pictures/locations/8xw1483352776.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Đăng nhập'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Đăng ký'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Thanh toán'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Bạn'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Chia sẽ'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Nâng cấp'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Trợ giúp'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Thông tin nhà phát triển'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.star_outline),
            title: Text('Đánh giá'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Thoát'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
