import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangesPass createState() => _ChangesPass();
}

class _ChangesPass extends State<ChangePass> {
  bool isPassWord = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
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
              const Padding(
                padding: EdgeInsets.all(15),
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
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, right: 50, left: 50),
                        child: Text("Lấy mã OTD qua sdt"),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, right: 50, left: 50),
                        child: SizedBox(
                          width: double.infinity,
                          height: 35,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.teal[300],
                            ),
                            onPressed: () {},
                            child: const Text("Lấy"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Mã OTD chỉ có hiệu lực trong vòng 5 phút",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
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
                padding: EdgeInsets.all(20),
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
                      hintText: "Nhập mật khẩu",
                      hintStyle: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
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
                      hintText: "Xác thực lại mật khẩu",
                      hintStyle: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, right: 150, left: 150),
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
            ],
          ),
        ),
      ),
    );
  }
}
