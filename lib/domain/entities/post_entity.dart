class PostEntity {
  int? id;
  int? userId;
  String? title;
  String? body;

  PostEntity({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  PostEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
