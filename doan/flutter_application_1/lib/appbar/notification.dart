import 'package:flutter/material.dart';

class Notifi extends StatefulWidget {
  const Notifi({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Nottification',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
