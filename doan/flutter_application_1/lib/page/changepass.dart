// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_capnhataikhoan.dart';
import 'package:flutter_application_1/api/api_doimatkhau.dart';
import 'package:flutter_application_1/main.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangesPass createState() => _ChangesPass();
}

class _ChangesPass extends State<ChangePass> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtOldPass = TextEditingController();
  TextEditingController txtNewPass = TextEditingController();
  TextEditingController TxtNewPassConfirm = TextEditingController();

  bool isPassWord1 = true;
  bool isPassWord2 = true;
  bool isPassWord3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/qmk2.jpg'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 75),
              child: Text(
                "Thay đổi mật khẩu",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(15),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: Padding(
            //           padding: EdgeInsets.only(
            //               top: 20, bottom: 20, right: 50, left: 50),
            //           child: Text("Lấy mã OTD qua sdt"),
            //         ),
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.only(
            //               top: 20, bottom: 20, right: 50, left: 50),
            //           child: SizedBox(
            //             width: double.infinity,
            //             height: 35,
            //             child: ElevatedButton(
            //               style: TextButton.styleFrom(
            //                 backgroundColor: Colors.teal[300],
            //               ),
            //               onPressed: () {},
            //               child: const Text("Lấy"),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.all(15),
            //   child: Text(
            //     "Mã OTD chỉ có hiệu lực trong vòng 5 phút",
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.all(20),
            //   child: Container(
            //     alignment: Alignment.centerLeft,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 6,
            //             offset: Offset(0, 2),
            //           ),
            //         ]),
            //     height: 60,
            //     child: TextField(
            //       keyboardType: TextInputType.number,
            //       style: TextStyle(
            //         color: Colors.black87,
            //       ),
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //         contentPadding: EdgeInsets.only(top: 14),
            //         prefixIcon: Icon(
            //           Icons.sms,
            //           color: Color(0xff99cccc),
            //         ),
            //         hintText: "Nhập mã OTD",
            //         hintStyle: TextStyle(
            //           color: Colors.black87,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 35),
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: txtOldPass,
                        validator: (val) => val!.isEmpty
                            ? 'Mật khẩu không được bỏ trống'
                            : null,
                        obscureText: isPassWord1,
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
                                isPassWord1 = !isPassWord1;
                              });
                            },
                            child: Icon(isPassWord1
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(0xff99cccc),
                          ),
                          hintText: "Nhập mật khẩu cũ",
                          hintStyle: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 35),
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: txtNewPass,
                        validator: (val) => val!.isEmpty
                            ? 'Mật khẩu không được bỏ trống'
                            : null,
                        obscureText: isPassWord2,
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
                                isPassWord2 = !isPassWord2;
                              });
                            },
                            child: Icon(isPassWord2
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
                    padding: EdgeInsets.only(right: 20, left: 20, top: 35),
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: TxtNewPassConfirm,
                        validator: (val) => val != txtNewPass.text
                            ? 'Mật khẩu không khớp'
                            : null,
                        obscureText: isPassWord3,
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
                                isPassWord3 = !isPassWord3;
                              });
                            },
                            child: Icon(isPassWord3
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(0xff99cccc),
                          ),
                          hintText: "Xác thực lại mật khẩu",
                          hintStyle: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ignore: deprecated_member_use
                        OutlineButton(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text(
                            'Quay lại',
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              if (txtOldPass.text == null ||
                                  txtNewPass.text == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Mật khẩu không được bỏ trống")));
                              } else if (txtNewPass.text !=
                                  TxtNewPassConfirm.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Mật khẩu không khớp")));
                              } else {
                                Auth.user = await apiChangePass(txtOldPass.text,
                                    txtNewPass.text, TxtNewPassConfirm.text);
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                });
                              }
                            }
                            ;
                          },
                          color: Colors.teal.shade300,
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Cập nhật',
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
