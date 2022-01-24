import 'package:flutter/material.dart';

class Infomation extends StatefulWidget {
  Infomation({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Infomation> {
  bool ShowPass = true;
  int _value = 1;
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
              // ignore: prefer_const_constructors
              newMethod('Họ tên', 'Trần Quang Vũ'),
              newMethod('Email', 'vutran.300101@gmail.com'),
              newMethod('SDT', '0967218557'),
              newMethod('Ngày sinh', '30/01/2001'),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  obscureText: ShowPass,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Mật khẩu',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'quangvu3001',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          ShowPass = !ShowPass;
                        });
                      },
                      child: Icon(
                          ShowPass ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              //newMethod('Mật khẩu', 'quangvu3001'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Row(
                    children: [
                      Radio(
                          value: 1, groupValue: _value, onChanged: (value) {}),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Nam'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 2, groupValue: _value, onChanged: (value) {}),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Nữ'),
                    ],
                  )
                ],
              ),
              const Text(
                'Đia chỉ : ',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              newMethod('Đia chỉ 1', 'TP HCM'),
              newMethod('Địa chỉ 2', 'Hà Nội'),
              const SizedBox(
                height: 35,
              ),
              Row(
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
                    onPressed: () {},
                    color: Colors.green,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget newMethod(String label, String ND) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        //obscureText: ShowPass,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: ND,
          hintStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
