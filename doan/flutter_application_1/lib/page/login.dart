// ignore_for_file: unnecessary_new, override_on_non_overriding_member, prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/URL.dart';
import 'package:flutter_application_1/api/api_response.dart';
import 'package:flutter_application_1/bottom/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/login.dart';
import '../api/api_service.dart';
import '../progressHUD.dart';
// ignore: unused_import
import 'setpass.dart';
// ignore: unused_import
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
  TextEditingController txtSDT = TextEditingController();
  TextEditingController txtPassWord = TextEditingController();

  // final scaffoldKey = GlobalKey<ScaffoldState>();
  // GlobalKey<FormState> globalFormKey = new GlobalKey();
  bool isPassWord = true;
  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;
  bool loading = false;

  var white;
  String _sdt = "";
  String _password = "";

  // void _loginUser() async {
  //   ApiResponse response = await login(_sdt, _password);
  //   if (response.data != null) {
  //     _saveAndGoHome(response.data as User);
  //   } else {
  //     setState(() {
  //       loading = false;
  //     });
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("${response.error}")));
  //   }
  // }

  // void _saveAndGoHome(User user) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   await pref.setString('token', user.token ?? '');
  //   await pref.setInt('Id', user.id ?? 0);
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => Home()), (route) => false);
  // }

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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/body-iu.jpeg'), fit: BoxFit.cover),
        ),
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
              child: Image.asset('images/logo.png', height: 100, width: 350),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
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
                        controller: txtSDT,
                        validator: (val) =>
                            val!.isEmpty ? 'SDT không được để trống' : null,
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        // decoration: kInputDecoration('SDT'),
                        decoration: new InputDecoration(
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
                        keyboardType: TextInputType.text,
                        controller: txtPassWord,
                        obscureText: isPassWord,
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        // decoration: kInputDecoration('PassWord'),
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
                            child: Icon(isPassWord
                                ? Icons.visibility
                                : Icons.visibility_off),
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
                  loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.green.shade300,
                          ),
                        )
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
                              onPressed: () async {
                                final kq = await apiLogin(
                                    txtSDT.text, txtPassWord.text);
                                if (kq.SDT.isNotEmpty) {
                                  Auth.user = kq;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
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
            Padding(
              padding: const EdgeInsets.only(
                  top: 5, bottom: 5, right: 100, left: 100),
              child: SizedBox(
                height: 30,
                width: 100,
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.teal[300],
                  ),
                  onPressed: () {},
                  label: const Text(
                    "Đăng nhập Facebook",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(Icons.facebook),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5, bottom: 5, right: 120, left: 120),
              child: SizedBox(
                height: 30,
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.teal[300],
                  ),
                  onPressed: () {},
                  label: const Text(
                    "Đăng nhập Gmail",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(Icons.email),
                ),
              ),
            ),
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
