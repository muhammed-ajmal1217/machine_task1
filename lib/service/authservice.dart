import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class ApiService {
  String uri = 'https://apiv2stg.promilo.com/user/oauth/token';
  Dio dio = Dio();

  Future<bool> login(String email, String password) async {
    String shaPassword = generateSHA(password);
    
    var payload = {
      'username': email,
      'password': shaPassword,
      'grant_type': password, 
    };
    dio.options.headers['Authorization'] = 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==';

    try {
      Response res = await dio.post(uri, data: FormData.fromMap(payload));
      
      if (res.statusCode == 200) {
        var responseData = res.data;
        var token = responseData['access_token'];
        print('Token: $token');
        return true; 
      } else {
        print("Error in response ${res.statusCode}");
        print('Response body ${res.data}');
        return false; 
      }
    } catch (e) {
      throw Exception('Apiservice Error $e'); 
    }
  }

  String generateSHA(String password) {
    List<int> bytes = utf8.encode(password);
    Digest sha256Hash = sha256.convert(bytes);
    return sha256Hash.toString();
  }
}
