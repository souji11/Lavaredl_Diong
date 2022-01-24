import 'package:flutter/material.dart';
import 'bottom/account.dart';
import 'bottom/chat.dart';
import 'bottom/home.dart';
import 'bottom/setting.dart';

class Bottoms extends StatefulWidget {
  Bottoms({Key? key}) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottoms> {
  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    const Chat(),
    const Setting(),
    const AccountS(),
  ];
  Widget currentSceent = Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
