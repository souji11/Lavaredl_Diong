// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unnecessary_null_comparison
import 'dart:convert';

import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/api/URL.dart';
import 'package:flutter_application_1/api/api_dangnhap.dart';
import 'package:flutter_application_1/api/api_response.dart';
import 'package:flutter_application_1/bottom/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import '../api/api_dangky.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController firstPassWord = TextEditingController();
  // TextEditingController lastPassWord = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtSDT = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassWord = TextEditingController();
  TextEditingController txtPassWordConfirm = TextEditingController();
  bool loading = false;

  String _sdt = "";
  String _password1 = "";
  String _password2 = "";

  bool isPassWord = true;
  bool isPassWord2 = true;

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/dk2.jpg'), fit: BoxFit.cover),
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
                padding: const EdgeInsets.all(15),
                child: Image.asset('images/logo.png', height: 100, width: 350),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Đăng ký",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
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
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) => val!.isEmpty
                                ? 'Email không được bỏ trống'
                                : null,
                            controller: txtEmail,
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
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            onChanged: (value) {
                              _sdt = value;
                            },
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
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (val) => val!.isEmpty
                                ? 'Số điện thoại không được bỏ trống'
                                : null,
                            controller: txtSDT,
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
                            onChanged: (value) {
                              _sdt = value;
                            },
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 5, bottom: 5, right: 170, left: 170),
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     height: 35,
                      //     child: ElevatedButton(
                      //       style: TextButton.styleFrom(
                      //         backgroundColor: Colors.teal[300],
                      //       ),
                      //       onPressed: () {},
                      //       child: const Text("Lấy mã OTD"),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(5),
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
                          child: TextFormField(
                            controller: txtPassWord,
                            validator: (val) => val!.isEmpty
                                ? 'Mật khẩu không được bỏ trống'
                                : null,
                            obscureText: isPassWord,
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                              hintText: "Nhập mật khẩu",
                              hintStyle: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            onChanged: (value) {
                              _password1 = value;
                            },
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
                          child: TextFormField(
                            controller: txtPassWordConfirm,
                            validator: (val) => val != txtPassWord.text
                                ? 'Mật khẩu không khớp'
                                : null,
                            obscureText: isPassWord2,
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                              hintText: "Xác thực lại mật khẩu",
                              hintStyle: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            onChanged: (value) {
                              _password2 = value;
                            },
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //       value: checkbox1,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           checkbox1 = !checkbox1;
                      //         });
                      //       },
                      //     ),
                      //     const Text("Điều khoản 1"),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //       value: checkbox2,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           checkbox2 = !checkbox2;
                      //         });
                      //       },
                      //     ),
                      //     const Text("Điều khoản 2"),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //       value: checkbox3,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           checkbox3 = !checkbox3;
                      //         });
                      //       },
                      //     ),
                      //     const Text("Điều khoản 3"),
                      //   ],
                      // ),
                      loading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Colors.green.shade300,
                            ))
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, right: 150, left: 150),
                              child: SizedBox(
                                width: double.infinity,
                                height: 35,
                                child: ElevatedButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.teal[300],
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      if (txtSDT.text == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Số điện thoại không được bỏ trống")));
                                      } else if (txtPassWord.text !=
                                          txtPassWordConfirm.text) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Mật khẩu không khớp")));
                                      } else {
                                        setState(() {
                                          showLoading();
                                          // loading = !loading;
                                          Provider.of<Apidangky>(context,
                                                  listen: false)
                                              .DangKyUser(
                                                  txtSDT.text,
                                                  txtPassWord.text,
                                                  txtEmail.text);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login()));
                                        });
                                      }
                                      EasyLoading.dismiss();
                                    }
                                  },
                                  child: const Text("Đăng ký"),
                                ),
                              ),
                            ),
                    ],
                  )),
              Divider(
                color: Colors.grey,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 5, bottom: 5, right: 100, left: 100),
              //   child: SizedBox(
              //     height: 30,
              //     width: 100,
              //     child: ElevatedButton.icon(
              //       style: TextButton.styleFrom(
              //         backgroundColor: Colors.teal[300],
              //       ),
              //       onPressed: () {},
              //       label: const Text(
              //         "Đăng nhập Facebook",
              //         style: TextStyle(
              //           color: Colors.white,
              //         ),
              //       ),
              //       icon: const Icon(Icons.facebook),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 5, bottom: 5, right: 120, left: 120),
              //   child: SizedBox(
              //     height: 30,
              //     child: ElevatedButton.icon(
              //       style: TextButton.styleFrom(
              //         backgroundColor: Colors.teal[300],
              //       ),
              //       onPressed: () {},
              //       label: const Text(
              //         "Đăng nhập Gmail",
              //         style: TextStyle(
              //           color: Colors.white,
              //         ),
              //       ),
              //       icon: const Icon(Icons.email),
              //     ),
              //   ),
              // ),
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
    );
  }
}

void showLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..radius = 50
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.indigo
    ..textColor = Colors.indigo
    ..fontSize = 20;
  EasyLoading.show(
    status: "Please wait...",
    maskType: EasyLoadingMaskType.black,
  );
}
