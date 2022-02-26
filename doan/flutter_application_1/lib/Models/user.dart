// ignore_for_file: non_constant_identifier_names, unnecessary_new, prefer_collection_literals

class User {
  late int id;
  String? name;
  late String email;
  int? GioiTinh;
  DateTime? NgaySinh;
  String? DiaChi1;
  String? DiaChi2;
  late String SDT;
  int? Quyen;
  int? TrangThai;

  User({
     required this.id,
    this.name,
    required this.email,
    this.GioiTinh,
    this.NgaySinh,
    this.DiaChi1,
    this.DiaChi2,
    required this.SDT,
    this.Quyen,
    this.TrangThai,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int; 
    name = json['name'];
    email = json['email'];
    GioiTinh = json['GioiTinh'] as int?;
    NgaySinh = json['NgaySinh'] == null
        ? null
        : DateTime.parse(json['NgaySinh'] as String);
    DiaChi1 = json['DiaChi1'];
    DiaChi2 = json['DiaChi2'];
    SDT = json['SDT'];
    Quyen = json['Quyen'] ?? 0;
    TrangThai = json['TrangThai'] ?? 0;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['GioiTinh'] = GioiTinh;
    data['NgaySinh'] = NgaySinh!.toIso8601String();
    data['DiaChi1'] = DiaChi1;
    data['DiaChi2'] = DiaChi2;
    data['SDT'] = SDT;
    data['Quyen'] = Quyen;
    data['TrangThai'] = TrangThai;
    return data;
  }

  User.empty() {
    id = -1;
    name = "";
    email = "";
    GioiTinh = 0;
    NgaySinh = null;
    DiaChi1 = "";
    DiaChi2 = "";
    SDT = "";
    Quyen = -1;
    TrangThai = -1;
  }

  void logOut() {
    id = -1;
    name = "";
    email = "";
    GioiTinh = 0;
    NgaySinh = null;
    DiaChi1 = "";
    DiaChi2 = "";
    SDT = "";
    Quyen = -1;
    TrangThai = -1;
  }
}
