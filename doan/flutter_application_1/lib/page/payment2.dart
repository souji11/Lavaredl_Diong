// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_field, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/Auth.dart';
import '../success/paymentsuccess.dart';

class Payment2 extends StatefulWidget {
  Payment2({Key? key}) : super(key: key);

  @override
  _Payment2 createState() => _Payment2();
}

class _Payment2 extends State<Payment2> {
  bool ShowPass = true;
  int _value = 1;
  TextEditingController txtName =
      TextEditingController(text: Auth.user.name.toString());
  TextEditingController txtSDT =
      TextEditingController(text: Auth.user.SDT.toString());
  TextEditingController txtDiaChi =
      TextEditingController(text: Auth.user.DiaChi1.toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                'Thanh toán',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/anh.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  height: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    // validator: (val) => val!.isEmpty ? 'Email khong duoc bo trong' : null,
                    controller: txtName,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      labelText: "Họ và tên",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xff99cccc),
                      ),
                      hintText: Auth.user.name.toString(),
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
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  height: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    // validator: (val) => val!.isEmpty ? 'Email khong duoc bo trong' : null,
                    controller: txtSDT,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      labelText: "Số điện thoại",
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Color(0xff99cccc),
                      ),
                      hintText: Auth.user.SDT.toString(),
                      hintStyle: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              //newMethod('Mật khẩu', 'quangvu3001'),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  height: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    // validator: (val) => val!.isEmpty ? 'Email khong duoc bo trong' : null,
                    controller: txtDiaChi,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      labelText: "Địa chỉ",
                      prefixIcon: Icon(
                        Icons.house_outlined,
                        color: Color(0xff99cccc),
                      ),
                      hintText: Auth.user.DiaChi1.toString(),
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
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentSuccess()));
                        });
                      },
                      color: Colors.teal.shade300,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Thanh toán',
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
      ),
    );
  }
<<<<<<< HEAD
=======

  // }
>>>>>>> dfe176d6a45deda8aa7cad8eb7257de0d5a2d893
}
