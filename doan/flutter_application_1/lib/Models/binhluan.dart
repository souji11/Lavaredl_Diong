// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new, camel_case_types

class binhluan {
  int id;
  int idTaiKhoan;
  int idSanPham;
  String noiDung;
  // Null? createdAt;
  // Null? updatedAt;
  // Null? deletedAt;

  binhluan(
      {
      required this.id,
      required this.idTaiKhoan,
      required this.idSanPham,
      required this.noiDung,
      // this.createdAt,
      // this.updatedAt,
      // this.deletedAt
      });

  binhluan.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    idTaiKhoan = json['IdTaiKhoan'],
    idSanPham = json['IdSanPham'],
    noiDung = json['NoiDung'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['IdTaiKhoan'] = this.idTaiKhoan;
    data['IdSanPham'] = this.idSanPham;
    data['NoiDung'] = this.noiDung;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['deleted_at'] = this.deletedAt;
    return data;
  }
}