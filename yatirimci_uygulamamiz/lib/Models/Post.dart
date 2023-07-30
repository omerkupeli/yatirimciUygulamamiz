class Post {
  final int id;
  final String body;
  final String image;
  final int user_id;
  final int panel_id;

  Post(
      {required this.id,
      required this.body,
      required this.image,
      required this.user_id,
      required this.panel_id});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        body: json['body'],
        image: "http://192.168.56.1:8000/storage/"+json['image'],
        user_id: json['user_id'],
        panel_id: json['panel_id']);
  }
  @override
  String toString() {
    return 'Post{id: $id, body: $body, image: $image, user_id: $user_id, panel_id: $panel_id}';
  }
}
