import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/tags.dart';

class ApiService {
  static const apiKey = 'f4de231a64msh5a19bc63a50cdc9p14d101jsnab7dd930f1ea';

  static const String baseUrl = 'tasty.p.rapidapi.com';

  static const Map<String, String> headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "tasty.p.rapidapi.com",
    "x-rapidapi-key": apiKey
  };

  Future<dynamic> get({
    required String endpoint,
    // required Map<String, dynamic> query,
  }) async {
    Uri uri = Uri.https(baseUrl, endpoint);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load JSON');
    }
  }
}
