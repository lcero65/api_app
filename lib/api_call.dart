import 'package:http/http.dart' as http;
import 'dart:convert';

class JsonApi {
  Future<List<dynamic>> getJSONData() async {
    final response =
    await http.get(Uri.https('jsonplaceholder.typicode.com', 'comments'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }
}