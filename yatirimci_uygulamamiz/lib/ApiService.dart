import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Models/Panel.dart';
import 'Models/User.dart';

class ApiService {
  String ipAdress = "192.168.56.1";
  Future<List<dynamic>> getAllPosts() async {
    final response =
        await http.get(Uri.parse('http://' '$ipAdress' ':8000/api/allPosts'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<List<dynamic>> getPostsByPanelId(int panelId) async {
    final response = await http.get(
        Uri.parse('http://' '$ipAdress' ':8000/api/postsByPanelId/$panelId'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<User> getUserById(int userId) async {
    final response =
        await http.get(Uri.parse('http://' '$ipAdress' ':8000/api/userById/2'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch user');
    }
  }

  Future<User> getAllUsers() async {
    final response =
        await http.get(Uri.parse('http://' '$ipAdress' ':8000/api/allUsers'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch user');
    }
  }

  Future<void> registerUser(String name, String email, String password) async {
  final url = 'http://192.168.56.1:8000/api/auth/register'; // Laravel API'nizin URL'sini buraya yazın

  final response = await http.post(
    Uri.parse(url),
    body: {
      'name': name,
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 201) {
    // Kayıt başarılı
    final responseData = json.decode(response.body);
    final accessToken = responseData['access_token'];
    print(accessToken);
    print(responseData['user']['name']);

    // Access Token'i kullanarak istediğiniz işlemi yapabilirsiniz.
    // Örneğin, tokeni yerel veritabanında saklayabilir ve kullanıcı oturumu açtığında kullanabilirsiniz.
  } else {
    // Kayıt sırasında bir hata oluştu
    // Hata mesajını gösterebilir veya başka işlemler yapabilirsiniz.
    final responseData = json.decode(response.body);
    final errorMessage = responseData['error'];
    print(errorMessage);
  }
}

Future<List<Panel>> fetchPanels() async {
  final response = await http.get(Uri.parse('http://example.com/api/panels'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => Panel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load panels');
  }
}
}
