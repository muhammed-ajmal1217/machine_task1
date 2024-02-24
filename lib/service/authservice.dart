import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String uri = 'https://apiv2stg.promilo.com/user/oauth/token';
  String expectedAuthorization = 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg=='; 

  Future<bool> login(String email, String password) async {
    String shaPassword = generateSHA(password); 

    var payload = {
      'username': email,
      'password': shaPassword,
      'grant_type': 'password',
    };

    var headers = {
      'Authorization': expectedAuthorization,
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    try {
      var response = await http.post(
        Uri.parse(uri),
        headers: headers,
        body: FormData(payload),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var token = responseData['access_token'];
        print('$token');
        return true;
      } else {
        print("Error in response ${response.statusCode}");
        print('Response body ${response.body}');
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

  String FormData(Map<String, String> data) {
    return data.entries.map((entry) => '${entry.key}=${entry.value}').join('&');
  }
}
