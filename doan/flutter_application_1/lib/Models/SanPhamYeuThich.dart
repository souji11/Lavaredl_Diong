// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new, unnecessary_question_mark, file_names, prefer_void_to_null

class SanPhamYeuThich {
  int id;
  int idSanPham;
  int idTaiKhoan;
  // String createdAt;
  // String updatedAt;
  // Null deletedAt;

  SanPhamYeuThich(
      {
        required this.id,
      required this.idSanPham,
      required this.idTaiKhoan,
      // required this.createdAt,
      // required this.updatedAt,
      // required this.deletedAt
      });

  SanPhamYeuThich.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    idSanPham = json['IdSanPham'],
    idTaiKhoan = json['IdTaiKhoan'];
    // createdAt = json['created_at'],
    // updatedAt = json['updated_at'],
    // deletedAt = json['deleted_at'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['IdSanPham'] = this.idSanPham;
    data['IdTaiKhoan'] = this.idTaiKhoan;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['deleted_at'] = this.deletedAt;
    return data;
  }
}