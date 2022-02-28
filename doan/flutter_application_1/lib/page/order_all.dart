import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/order.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_hoadon.dart';
import 'package:flutter_application_1/page/invoice_detail.dart';
import 'package:provider/provider.dart';

class PageOrderAll extends StatelessWidget {
  final TrangThai;
  PageOrderAll({@required this.TrangThai});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Order>>(
              future: fetchHoaDon_main(TrangThai),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1, 1),
                                    blurRadius: 20.0,
                                  ),
                                ]),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '#${snapshot.data![index].ID}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 90,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${setTrangThai(snapshot.data![index].IDTrangThai)}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.orange),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InvoiceDetail(
                                                        snapshot.data![index]
                                                            .ctHoaDon,
                                                        snapshot.data![index]
                                                            .TongTien,
                                                        snapshot.data![index]
                                                            .IDTrangThai,
                                                        snapshot
                                                            .data![index].ID,
                                                        snapshot.data![index]
                                                            .DiaChiGiaoHang,
                                                        snapshot.data![index]
                                                            .SDTGiaoHang)));
                                      },
                                      icon:
                                          const Icon(Icons.arrow_forward_ios)),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  String setTrangThai(int IDTrangThai) {
    String trangthai = "Error";
    if (IDTrangThai == 1) {
      trangthai = "Đơn mới đặt";
    } else if (IDTrangThai == 2) {
      trangthai = "Đơn đã xử lý";
    } else if (IDTrangThai == 3) {
      trangthai = "Đơn đang vận chuyển";
    } else if (IDTrangThai == 4) {
      trangthai = "Đơn đã hoàn thành";
    } else if (IDTrangThai == 5) {
      trangthai = "Đơn đã hủy";
    }
    return trangthai;
  }
}
