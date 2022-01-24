// ignore: unused_import
import 'package:flutter/material.dart';
import 'login.dart';

class SetPass extends StatefulWidget {
  const SetPass({Key? key}) : super(key: key);

  @override
  _SetPassState createState() => _SetPassState();
}

class _SetPassState extends State<SetPass> {
  bool isPassWord = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/qmk2.jpg'), fit: BoxFit.cover),
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.reply,
                    size: 40,
                  ),
                  tileColor: Colors.black,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child:
                      Image.asset('images/logo.png', height: 100, width: 350),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Quên mật khẩu",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xff99cccc),
                        ),
                        hintText: "Số điện thoại",
                        hintStyle: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 170, left: 170),
                  child: SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.teal[300],
                      ),
                      onPressed: () {},
                      child: const Text("Lấy mã OTD"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(
                          Icons.sms,
                          color: Color(0xff99cccc),
                        ),
                        hintText: "Nhập mã OTD",
                        hintStyle: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    height: 60,
                    child: TextField(
                      obscureText: isPassWord,
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPassWord = !isPassWord;
                            });
                          },
                          child: Icon(isPassWord
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color(0xff99cccc),
                        ),
                        hintText: "Nhập mật khẩu mới",
                        hintStyle: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    height: 60,
                    child: TextField(
                      obscureText: isPassWord,
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPassWord = !isPassWord;
                            });
                          },
                          child: Icon(isPassWord
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color(0xff99cccc),
                        ),
                        hintText: "Xác thực lại mật khẩu mới",
                        hintStyle: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 150, left: 150),
                  child: SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.teal[300],
                      ),
                      onPressed: () {},
                      child: const Text("Đổi mật khẩu"),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 5, bottom: 5, right: 190, left: 190),
                //   child: SizedBox(
                //     height: 30,
                //     child: ElevatedButton.icon(
                //       style: TextButton.styleFrom(
                //         backgroundColor: Colors.teal[300],
                //       ),
                //       onPressed: () {
                //         Navigator.pop(context,
                //             MaterialPageRoute(builder: (context) => Login()));
                //       },
                //       label: const Text(
                //         "Quay lại",
                //         style: TextStyle(
                //           color: Colors.white,
                //         ),
                //       ),
                //       icon: Icon(Icons.reply),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
