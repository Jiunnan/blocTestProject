
import 'package:http/http.dart';

class ApiBaseProvider {

  final client = Client();
  Map<String, String> headers = {};

  Future<Response> doPost(String path, Map<String, dynamic> postData) async {
    return await client.post(Uri(path: path), body: postData);
  }
}