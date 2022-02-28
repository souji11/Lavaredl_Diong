// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class Mau {
  int id;
  String tenmau;
  // Null? createdAt;
  // Null? updatedAt;

  Mau({
    required this.id,
    required this.tenmau,
  });

  Mau.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    tenmau = json['Tenmau'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Tenmau'] = this.tenmau;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    return data;
  }
}
