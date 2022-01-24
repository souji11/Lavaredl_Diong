class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}

class LoginRequestModel {
  late String sdt;
  late String password;

  LoginRequestModel({
    required this.sdt,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'sdt': sdt.trim(), 'password': password.trim()};

    return map;
  }
}
