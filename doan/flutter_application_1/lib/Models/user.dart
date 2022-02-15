class User {
  int? id;
  String? name;
  late String email;
  String? GioiTinh;
  DateTime? NgaySinh;
  String? DiaChi;
  late String SDT;
  int? Quyen;
  int? TrangThai;
  // String createdAt;
  // String updatedAt;
  // Null deletedAt;

  User({
    this.id,
    this.name,
    required this.email,
    this.GioiTinh,
    this.NgaySinh,
    this.DiaChi,
    required this.SDT,
    this.Quyen,
    this.TrangThai,

    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    GioiTinh = json['GioiTinh'];
    NgaySinh = json['NgaySinh'];
    DiaChi = json['DiaChi'];
    SDT = json['SDT'];
    Quyen = json['Quyen'] ?? 0;
    TrangThai = json['TrangThai'] ?? 0;
  }

  // createdAt = json['created_at'];
  // updatedAt = json['updated_at'];
  // deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['GioiTinh'] = this.GioiTinh;
    data['NgaySinh'] = this.NgaySinh;
    data['DiaChi'] = this.DiaChi;
    data['SDT'] = this.SDT;
    data['Quyen'] = this.Quyen;
    data['TrangThai'] = this.TrangThai;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['deleted_at'] = this.deletedAt;
    return data;
  }

  User.empty() {
    id = -1;
    name = "";
    email = "";
    GioiTinh = "";
    NgaySinh = null;
    DiaChi = "";
    SDT = "";
    Quyen = -1;
    TrangThai = -1;
  }
}
