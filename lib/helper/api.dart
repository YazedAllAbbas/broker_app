import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Future<dynamic> get({
    required String url,
    String? token,
  }) async {
    Map<String, String> headers = {'Accept': 'application/json'};
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    int statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      dynamic data = jsonDecode(response.body);
      print(statusCode);
      return data;
    } else {
      throw Exception(
          "there is a proplem with status code $statusCode with body ${response.body}");
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {'Accept': 'application/json'};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: headers);
      int statusCode = response.statusCode;
      Map<String, dynamic> data = jsonDecode(response.body);

      if (statusCode == 201 || statusCode == 200) {
        if (data.containsKey('access_token')) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', data['access_token']);
          print(prefs.getString('access_token'));
        }
        return 'success';
      } else if (statusCode == 401 ||
          statusCode == 404 ||
          statusCode == 422 ||
          statusCode == 500) {
        return data["message"];
      } else {
        throw Exception(
            "هناك مشكلة في الكود: $statusCode مع المحتوى ${jsonDecode(response.body)}");
      }
    } on http.ClientException catch (e) {
      print("ClientException: ${e.message}");
      throw Exception(
          "حدث خطأ في الاتصال بالخادم. الرجاء المحاولة مرة أخرى لاحقًا.");
    } catch (e) {
      throw Exception("حدث خطأ غير متوقع: ${e.toString()}");
    }
  }

  Future<dynamic> delete({
    required String url,
    required dynamic body,
    required String token,
  }) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body), // ترميز الجسم إلى JSON
      );

      int statusCode = response.statusCode;
      Map<String, dynamic> data = jsonDecode(response.body);

      if (statusCode >= 200 && statusCode < 300) {
        return "success";
      } else if (statusCode >= 400) {
        return data["message"];
      } else {
        throw Exception(
            "هناك مشكلة في الكود: $statusCode مع المحتوى ${jsonDecode(response.body)}");
      }
    } on http.ClientException catch (e) {
      print("ClientException: ${e.message}");
      throw Exception(
          "حدث خطأ في الاتصال بالخادم. الرجاء المحاولة مرة أخرى لاحقًا.");
    } catch (e) {
      throw Exception("حدث خطأ غير متوقع: ${e.toString()}");
    }
  }
}

class UserService {
  final Api api = Api();

  Future<dynamic> registerUser({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
  }) async {
    const String url =
        "hhttps://bba2-185-107-56-165.ngrok-free.app/api/auth/register";
    try {
      dynamic data = await api.post(
        url: url,
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'phone': phone,
          'email': email,
          'password': password,
        },
      );
      return data;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    const String url =
        "https://bba2-185-107-56-165.ngrok-free.app/api/auth/login";
    try {
      dynamic data = await api.post(
        url: url,
        body: {
          'email': email,
          'password': password,
        },
      );
      print("Response Data: $data"); // طباعة استجابة الخادم للمساعدة في التشخيص
      return data;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> removeAccount({
    required String email,
    required String password,
  }) async {
    const String url =
        "https://bba2-185-107-56-165.ngrok-free.app/api/auth/removeAccount";
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');
      if (token == null) {
        throw Exception("لم يتم العثور على رمز الوصول.");
      }
      print(token);

      dynamic data = await api.delete(
        url: url,
        body: {
          "email": email,
          "password": password,
        },
        token: token,
      );

      return data;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> logoutUser() async {
    const String url =
        "https://bba2-185-107-56-165.ngrok-free.app/api/auth/logout";
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');
      print(token.toString());
      dynamic data = await api.post(
        url: url,
        body: {},
        token: token.toString(),
      );
      return data;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
