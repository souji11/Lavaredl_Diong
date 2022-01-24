import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'login.dart';

class PageBinhLuan extends StatefulWidget {
  const PageBinhLuan({Key? key}) : super(key: key);

  @override
  _PageBinhLuan createState() => _PageBinhLuan();
}

class _PageBinhLuan extends State<PageBinhLuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Column(
          // ignore: prefer_const_literals_to_create_immutables
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
                    "images/iu.jpg",
                    height: 300,
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
                            "Tên sản phẩm: ...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
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
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Giá tiền: ...",
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
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Bình luận")),
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
                  onPressed: () {},
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
