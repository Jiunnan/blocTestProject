import 'dart:convert';
import 'package:http/http.dart';
import 'package:vtuberlist/resources/app_parameter.dart';

class LoginAPI {

  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> postData = {
      "email": email,
      "password": password
    };
    String postDataString = jsonEncode(postData);
    print("JN - api body ${postDataString}");
    var url = Uri.parse(APPParameter.apiDomain + "/login/");
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await post(url, headers: headers, body: postDataString);
    if (response.statusCode == 200) {
      Map<String, dynamic> returnData = jsonDecode(response.body);
      return returnData;
    } else {
      return {"error": "api error: ${response.statusCode}"};
    }
  }
}