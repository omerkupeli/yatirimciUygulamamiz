class Comment {
  final int id;
  final String comment;
  final int user_id;
  final int post_id;
  final String created_at;


Comment({
  required this.id,
  required this.comment,
  required this.user_id,
  required this.post_id,
  required this.created_at,

});

factory Comment.fromJson(Map<String, dynamic> json) {
  return Comment(
    id: json['id'],
    comment: json['comment'],
    user_id: json['user_id'],
    post_id: json['post_id'],
    created_at: json['created_at'],
  );
}


@override
String toString() {
  return 'Comment{id: $id, comment: $comment, user_id: $user_id, post_id : $post_id } created_at: $created_at' ;
}
}

