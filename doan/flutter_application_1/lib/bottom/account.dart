import 'package:flutter/material.dart';
import '../page/infomation.dart';
import '../appbar/cart.dart';
import '../page/order.dart';
import '../appbar/favorite.dart';
import 'home.dart';

class AccountS extends StatefulWidget {
  const AccountS({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<AccountS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'TÀI KHOẢN',
                  //textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: const Color(0xFFF5F6F9),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Infomation()),
                  );
                },
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      'Thông tin cá nhân',
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: const Color(0xFFF5F6F9),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      'Giỏ hàng',
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: const Color(0xFFF5F6F9),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Order()),
                  );
                },
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.local_shipping,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      'Đơn hàng',
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: const Color(0xFFF5F6F9),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favorite()),
                  );
                },
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      'Yêu thích',
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
