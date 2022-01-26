// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new, unnecessary_question_mark, file_names, prefer_void_to_null, camel_case_types

class Product_main {
  int id;
  String tenSanPham;
  int gia;
  String moTa;
  String size;
  String mau;
  int soLuong;
  int idLoaiSanPham;
  int idNhaCung;
  String hinhAnh;
  int trangThai;
  // String? createdAt;
  // String? updatedAt;
  // Null? deletedAt;

  Product_main(
      {required this.id,
      required this.tenSanPham,
      required this.gia,
      required this.moTa,
      required this.size,
      required this.mau,
      required this.soLuong,
      required this.idLoaiSanPham,
      required this.idNhaCung,
      required this.hinhAnh,
      required this.trangThai,
      // this.createdAt,
      // this.updatedAt,
      // this.deletedAt});
      });

   Product_main.fromJson(Map<String, dynamic> json) : 
    id  = json['id'],
    tenSanPham  = json['TenSanPham'],
    gia =  json['Gia'],
    moTa = json['MoTa'],
    size = json['Size'],
    mau = json['Mau'],
    soLuong =  json['SoLuong'],
    idLoaiSanPham = json['IdLoaiSanPham'],
    idNhaCung = json['IdNhaCung'],
    hinhAnh = json['HinhAnh'],
    trangThai = json['TrangThai'];
    // createdAt : json['created_at'],
    // updatedAt : json['updated_at'],
    // deletedAt : json['deleted_at'];
 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['TenSanPham'] = this.tenSanPham;
    data['Gia'] = this.gia;
    data['MoTa'] = this.moTa;
    data['Size'] = this.size;
    data['Mau'] = this.mau;
    data['SoLuong'] = this.soLuong;
    data['IdLoaiSanPham'] = this.idLoaiSanPham;
    data['IdNhaCung'] = this.idNhaCung;
    data['HinhAnh'] = this.hinhAnh;
    data['TrangThai'] = this.trangThai;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['deleted_at'] = this.deletedAt;
    return data;
  }
  
}
