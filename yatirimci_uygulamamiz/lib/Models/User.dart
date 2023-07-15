import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String image;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: "",
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'image': image,
    };
  }

  //to String methodu
  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password, image: $image}';
  }
}
