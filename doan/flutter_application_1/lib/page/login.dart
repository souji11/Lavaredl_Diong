// ignore_for_file: unnecessary_new, override_on_non_overriding_member, prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, avoid_print, unused_import, unused_field, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/URL.dart';
import 'package:flutter_application_1/api/api_response.dart';
import 'package:flutter_application_1/bottom/home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/login.dart';
import '../api/api_service.dart';
import '../progressHUD.dart';

import 'setpass.dart';

import 'register.dart';
import '../main.dart';
import '../api/api_dangnhap.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtSDT = TextEditingController(text: "souji@gmail.com");
  TextEditingController txtPassWord = TextEditingController(text: "123");

  bool isPassWord = true;
  bool isApiCallProcess = false;
  bool loading = false;

  var white;
  String _sdt = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      body: Container(
        //background
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/body-iu.jpeg'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: <Widget>[
            //logo
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset('images/logo.png', height: 100, width: 350),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  //chữ đăng nhập
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //SDT/Email
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ]),
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: txtSDT,
                        validator: (val) => val!.isEmpty ? 'Số điện thoại / Email không được bỏ trống' : null,
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xff99cccc),
                          ),
                          hintText: "Số điện thoại / Email",
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
                  //Mật khẩu
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ]),
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (val) => val!.isEmpty ? 'Mật khẩu không được bỏ trống' : null,
                        controller: txtPassWord,
                        obscureText: isPassWord,
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPassWord = !isPassWord;
                              });
                            },
                            child: Icon(isPassWord ? Icons.visibility : Icons.visibility_off),
                          ),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(0xff99cccc),
                          ),
                          hintText: "Mật khẩu",
                          hintStyle: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                    ),
                  ),
                  //nút đăng nhập
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, right: 150, left: 150),
                    child: SizedBox(
                      width: double.infinity,
                      height: 35,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.teal[300],
                        ),
                        onPressed: () async {
                          if (txtSDT == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Số điện thoại / Email không được bỏ trống")));
                          }
                          if (txtPassWord == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mật khẩu không được bỏ trống")));
                          } else {
                            final kq = await apiLogin(txtSDT.text, txtPassWord.text);
                            if (kq.SDT.isNotEmpty) {
                              Auth.user = kq;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                            }
                          }
                        },
                        child: const Text("Đăng nhập"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            //nút quên mật khẩu
            TextButton(
              child: const Text(
                "Quên mật khẩu ?",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SetPass()),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Bạn chưa có tài khoản ?",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //nút đăng ký
            TextButton(
              child: const Text(
                "Đăng ký ?",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
