// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_field, prefer_typing_uninitialized_variables, prefer_final_fields, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/Models/Product_main.dart';
import 'package:flutter_application_1/Models/binhluan.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_them_binhluan.dart';
import 'package:flutter_application_1/bottom/home.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class PageBinhLuan extends StatefulWidget {
  final Product_main product;
  const PageBinhLuan({Key? key, required this.product}) : super(key: key);

  @override
  _PageBinhLuan createState() => _PageBinhLuan();
}

class _PageBinhLuan extends State<PageBinhLuan> {
  TextEditingController Content = TextEditingController();

  var white;
  String _content = "";
  @override
  Widget build(BuildContext context) {
    var apibinhluan = Provider.of<APIThemCMT>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Column(
          children: [
            const Text(
              "Bình luận",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(5)),
                Expanded(
                  child: Image.asset(
                    'assets' + widget.product.hinhAnh,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Tên sản phẩm: ${widget.product.tenSanPham}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        // MÀU VÀ SIZES Chưa xử lý đâu
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Size: ...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Màu: ...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        // MÀU VÀ SIZES Chưa xử lý đâu
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Giá tiền:${widget.product.gia}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: Content,
                validator: (val) =>
                    val!.isEmpty ? 'Bạn nên ghi gì đó vào' : null,
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nhận xét của bạn"),
                ),
                onChanged: (value) {
                  _content = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 50, left: 50),
              child: SizedBox(
                height: 30,
                width: 100,
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green[400],
                  ),
                  onPressed: () {
                    apibinhluan.ThemBinhLuan(
                        Auth.user.id, widget.product.id, Content.text);
                    Navigator.pop(context);
                  },
                  label: const Text(
                    "Bình luận",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(Icons.star_outline),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(15),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: <Widget>[
            //       Expanded(
            //         child: TextButton(
            //             onPressed: () {
            //               Navigator.pop(context,
            //                   MaterialPageRoute(builder: (context) => Login()));
            //             },
            //             child: Image.asset(
            //               'images/back.png',
            //               height: 20,
            //               width: 20,
            //             )),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
