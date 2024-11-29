import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "https://api.tvmaze.com";

  static Future<List<dynamic>> fetchMovies(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=$query'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch movies");
    }
  }
}
