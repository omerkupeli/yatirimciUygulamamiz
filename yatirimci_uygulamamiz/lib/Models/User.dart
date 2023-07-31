
class User {
  final int id;
  final String name;
  final String? email;
  final String? username; // Kullanıcı adını opsiyonel olarak belirtiyoruz
  final String password;
  final String image;

  User({
    required this.id,
    required this.name,
    this.email,
    this.username, // Kullanıcı adını opsiyonel olarak kabul ediyoruz
    required this.password,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'], // JSON'da "username" varsa, onu alıyoruz
      password: "",
      image: json['image'] ?? 'http://192.168.56.1:8000/storage/posts/-1690794550.jpg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username, // JSON'a "username"i ekliyoruz (opsiyonel)
      'password': password,
      'image': image,
    };
  }

  //toString methodu
  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, username: $username, password: $password, image: $image}';
  }
}
