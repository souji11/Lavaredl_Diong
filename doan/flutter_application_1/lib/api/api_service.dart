// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/login.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    final response = await http.post(Uri.parse('http://reqres.in/api/login'),
        body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
