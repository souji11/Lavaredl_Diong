// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_field, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_giohang_index.dart';
import 'package:provider/provider.dart';
import '../success/paymentsuccess.dart';
import 'package:flutter_application_1/api/Auth.dart';

class Payment2 extends StatefulWidget {
  Payment2({Key? key}) : super(key: key);

  @override
  _Payment2 createState() => _Payment2();
}

class _Payment2 extends State<Payment2> {
  bool _checkbox = false;
  bool isVisible = false;
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
    Provider.of<ApiGioHang>(context, listen: false).fetchgiohang();
    var api = Provider.of<ApiGioHang>(context, listen: false);
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Consumer<ApiGioHang>(builder: (_, value, child) {
          return ListView(
            children: [
              const Text(
                'Thanh toán',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              //anh
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

              //HoTen
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

              SizedBox(
                height: 15,
              ),

              ...List.generate(api.lst.length, (index) {
                return Column(
                  children: [
                    Positioned(
                      top: 320,
                      child: Container(
                        height: 150,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey, //Color(0xFFd8dbe0),
                                offset: Offset(1, 1),
                                blurRadius: 20.0,
                              ),
                            ]),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey,
                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets' +
                                              api.lst[index].hinhAnh)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                          'Tên sản phẩm: ${api.lst[index].tenSanPham}'),
                                      Text(
                                          'Sô lượng    : ${api.lst[index].so_Luong}'),
                                      Text(
                                          'Đơn giá     : \$${api.lst[index].gia}'),
                                      Text('Màu     : ${api.lst[index].mU}'),
                                      Text(
                                          'Size     : ${api.lst[index].tenSize}'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Tổng tiền: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '\$${api.total} ',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),

              Row(
                children: [
                  Checkbox(
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = true;
                      });
                    },
                  ),
                  Text(
                    'Thanh toán khi nhận hàng',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
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
                          api.Thanhtoan(Auth.user.id, txtDiaChi.text,
                              txtSDT.text, api.total, 1);
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
          );
        }),
      ),
    ));
  }

  // }
}
