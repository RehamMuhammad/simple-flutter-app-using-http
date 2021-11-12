class Comment {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;


  Comment(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    var commentMap = <String, dynamic>{};
    commentMap['postId'] = postId;
    commentMap['id'] = id;
    commentMap['name'] = name;
    commentMap['email'] = email;
    commentMap['body'] = body;
    return commentMap;
  }
}
