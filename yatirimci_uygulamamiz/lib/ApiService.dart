import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Models/User.dart';

class ApiService {
  String ipAdress = "192.168.137.236";
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
}
