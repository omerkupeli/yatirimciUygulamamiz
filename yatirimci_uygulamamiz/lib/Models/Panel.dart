class Panel {
  final int id;
  final String name;
  final int user_id;
  final String? image;

  Panel({required this.id, required this.name, required this.user_id , this.image});

  factory Panel.fromJson(Map<String, dynamic> json) {
    return Panel(id: json['id'], name: json['name'], user_id: json['user_id'] , image: json['image']);
  }

  @override
  String toString() {
    return 'Panel{id: $id, name: $name, user_id: $user_id , image: $image}';
  }
}
