import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationApi {
  Future<bool> login(String email, String password) async {
    try {
      String authApi = base_api + all_authors_api;
      Map<String, String> headers = {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      };
      Map<String, String> body = {"email": email, "password": password};
      var response = await http.post(authApi, headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        var token = data['access_token'];
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);
        return true;
      }
      return false;
    } catch (exception) {
      print(exception.toString());
      return false;
    }
  }
}
