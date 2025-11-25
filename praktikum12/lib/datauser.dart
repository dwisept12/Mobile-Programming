import 'dart:convert';
import 'package:http/http.dart' as http;

class DataUser {
  Future<List<dynamic>> fetchDataUser() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)", 
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}