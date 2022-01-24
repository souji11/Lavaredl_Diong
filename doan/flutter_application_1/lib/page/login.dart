import 'package:flutter/material.dart';
import '../Models/login.dart';
import '../api/api_service.dart';
import '../progressHUD.dart';
// ignore: unused_import
import 'setpass.dart';
// ignore: unused_import
import 'register.dart';
import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey();
  bool isPassWord = true;
  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;

  var white;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel(sdt: '', password: '');
  }

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
    return MaterialApp(
      home: Scaffold(
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
                key: globalFormKey,
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
                          onSaved: (input) => requestModel.sdt = input!,
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
                            hintText: "Số điện thoại",
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
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: isPassWord,
                          onSaved: (input) => requestModel.password = input!,
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
                          onPressed: () {
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()));
                              });

                              APIService apiService = new APIService();
                              apiService.login(requestModel).then((value) {
                                setState(() {
                                  isApiCallProcess = false;
                                });

                                if (value.token.isNotEmpty) {
                                  final snackBar = SnackBar(
                                    content: Text("Đăng nhập thành công"),
                                  );
                                  scaffoldKey.currentState!
                                      // ignore: deprecated_member_use
                                      .showSnackBar(snackBar);
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text(value.error),
                                  );
                                  scaffoldKey.currentState!
                                      // ignore: deprecated_member_use
                                      .showSnackBar(snackBar);
                                }
                              });
                              print(requestModel.toJson());
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
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
