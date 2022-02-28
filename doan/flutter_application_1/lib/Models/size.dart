// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this, camel_case_types

class size {
  int id;
  String tenSize;
  

  size({required this.id,required this.tenSize});

  size.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    tenSize = json['TenSize'];
    
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['TenSize'] = this.tenSize;
   
    return data;
  }
}