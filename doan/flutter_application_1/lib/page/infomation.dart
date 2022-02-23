// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_final_fields, prefer_const_constructors, unused_import, constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_capnhataikhoan.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/page/login.dart';
import 'package:flutter_application_1/success/updatesuccess.dart';
import 'package:intl/intl.dart';

class Infomation extends StatefulWidget {
  Infomation({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

enum GioiTinh { Nam, Nu }

class _InformationState extends State<Infomation> {
  TextEditingController txtEmail = TextEditingController(text: Auth.user.email.toString());
  TextEditingController txtName = TextEditingController(text: Auth.user.name.toString());
  TextEditingController txtSDT = TextEditingController(text: Auth.user.SDT.toString());
  DateTime txtNgaySinh = Auth.user.NgaySinh ?? DateTime.now();
  TextEditingController txtGioiTinh = TextEditingController();
  TextEditingController txtDiaChi1 = TextEditingController(text: Auth.user.DiaChi1.toString());
  TextEditingController txtDiaChi2 = TextEditingController(text: Auth.user.DiaChi2.toString());

  bool ShowPass = true;
  GioiTinh? _gioiTinh = Auth.user.GioiTinh == 1 ? GioiTinh.Nam : GioiTinh.Nu;
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
                'Thông tin cá nhân',
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
                        border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
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
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ]),
                  height: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: txtEmail,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xff99cccc),
                      ),
                      hintText: Auth.user.email.toString(),
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
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
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
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      labelText: "Số điện thoại",
                      prefixIcon: Icon(
                        Icons.phone_android_outlined,
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
                  child: DateTimeField(
                    initialValue: txtNgaySinh,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    format: DateFormat("yyyy-MM-dd"),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      labelText: "Ngày sinh",
                      prefixIcon: Icon(
                        Icons.date_range_outlined,
                        color: Color(0xff99cccc),
                      ),
                      hintText: Auth.user.NgaySinh.toString(),
                      hintStyle: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                              context: context, firstDate: DateTime(1900), initialDate: currentValue ?? txtNgaySinh, lastDate: DateTime.now())
                          .then((value) => txtNgaySinh = value!);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio<GioiTinh>(
                            value: GioiTinh.Nam,
                            focusColor: Colors.teal.shade300,
                            activeColor: Colors.teal.shade300,
                            groupValue: _gioiTinh,
                            onChanged: (value) {
                              setState(() {
                                _gioiTinh = value;
                              });
                            }),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Nam'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<GioiTinh>(
                            value: GioiTinh.Nu,
                            focusColor: Colors.teal.shade300,
                            activeColor: Colors.teal.shade300,
                            groupValue: _gioiTinh,
                            onChanged: (value) {
                              setState(() {
                                _gioiTinh = value;
                              });
                            }),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Nữ'),
                      ],
                    )
                  ],
                ),
              ),
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
                    controller: txtDiaChi1,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      labelText: "Địa chỉ 1",
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
                    controller: txtDiaChi2,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      labelText: "Địa chỉ 2",
                      prefixIcon: Icon(
                        Icons.house_outlined,
                        color: Color(0xff99cccc),
                      ),
                      hintText: Auth.user.DiaChi2.toString(),
                      hintStyle: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                        style: TextStyle(fontSize: 14, letterSpacing: 2.2, color: Colors.black),
                      ),
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () async {
                        final _user = Auth.user;
                        _user.name = txtName.text;
                        _user.email = txtEmail.text;
                        _user.SDT = txtSDT.text;
                        _user.NgaySinh = txtNgaySinh;
                        _user.GioiTinh = _gioiTinh == GioiTinh.Nam ? 1 : 0;
                        _user.DiaChi1 = txtDiaChi1.text;
                        _user.DiaChi2 = txtDiaChi2.text;

                        Auth.user = await apiUpdate(_user);
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateSuccess()));
                        });
                      },
                      color: Colors.teal.shade300,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Cặp nhật',
                        style: TextStyle(fontSize: 14, letterSpacing: 2.2, color: Colors.white),
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
}
