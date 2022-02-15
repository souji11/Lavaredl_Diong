import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Models/user.dart';
import 'URL.dart';

// class Apidangnhap extends ChangeNotifier {
//   Future<User> DangNhapUser(String SDT, String password) async {
//     final response = await http.post(Uri.parse(loginURL), body: {
//       'SDT': SDT.toString(),
//       'password': password.toString(),
//     });
//     if (response.statusCode == 200) {
//       return User.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception("Error");
//     }
//   }
// }

// Future<ApiResponse> login(String SDT, String password) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     final response = await http.post(Uri.parse(loginURL),
//         headers: {'Accept': 'application/json'},
//         body: {'SDT': SDT, 'password': password});

//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = User.fromJson(jsonDecode(response.body));
//         break;
//       case 422:
//         final errors = jsonDecode(response.body)['errors'];
//         apiResponse.error = errors[errors.keys.elementAt(0)][0];
//         break;
//       case 403:
//         apiResponse.error = jsonDecode(response.body)['message'];
//         break;
//       default:
//         apiResponse.error = somgThingWenWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;

//   // final response = await http
//   //       .post(Uri.parse("http://127.0.0.1:8000/api/User/register"), body: {
//   //     'SDT': SDT.toString(),
//   //     'password': password.toString(),
//   //   });
//   //   if (response.statusCode == 200) {
//   //     return User.fromJson(jsonDecode(response.body));
//   //   } else {
//   //     throw Exception("Error");
//   //   }
// }

Future<User> apiLogin(String emailSDT, String password) async {
  User acc;
  String url = loginURL;
  var response = await http.post(Uri.parse(url),
      body: {"email": emailSDT, "password": password, "SDT": emailSDT});
  if (response.statusCode == 200) {
    final jsondata = json.decode(response.body);
    acc = User.fromJson(jsondata);
  } else {
    throw Exception("Fail");
  }
  return acc;
}

_setHeader() => {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };

// Future<ApiResponse> register(String SDT, String password) async {
//   ApiResponse apiResponse = ApiResponse();

//   final response = await http.post(Uri.parse(registerURL),
//       headers: {'Accept': 'application/json'},
//       body: {'SDT': SDT, 'password': password});
//   if (response.statusCode == 200) {
//     try {
//       apiResponse.data = User.fromJson(jsonDecode(response.body));
//     } catch (e) {
//       apiResponse.error = serverError;
//     }
//   }
//   // try {
//   //   switch (response.statusCode) {
//   //     case 200:
//   //       apiResponse.data = User.fromJson(jsonDecode(response.body));
//   //       break;
//   //     case 422:
//   //       final errors = jsonDecode(response.body)['errors'];
//   //       apiResponse.error = errors[errors.keys.elementAt(0)][0];
//   //       break;
//   //     default:
//   //       apiResponse.error = somgThingWenWrong;
//   //       break;
//   //   }
//   // } catch (e) {
//   //   apiResponse.error = serverError;
//   // }
//   return apiResponse;

// final response = await http
//       .post(Uri.parse("http://127.0.0.1:8000/api/User/register"), body: {
//     'SDT': SDT.toString(),
//     'password': password.toString(),
//   });
//   if (response.statusCode == 200) {
//     return User.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception("Error");
//   }
// }

Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http
        .post(Uri.parse("http://127.0.0.1:8000/api/User/user"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = uanauthorized;
        break;
      default:
        apiResponse.error = somgThingWenWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('id') ?? 0;
}

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}
