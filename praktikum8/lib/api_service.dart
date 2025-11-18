import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseurl = 'https://jsonplaceholder.typicode.com';

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseurl/posts'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }
}
