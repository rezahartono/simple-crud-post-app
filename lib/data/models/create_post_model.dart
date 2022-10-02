class CreatePostModel {
  int? userId;
  String? title;
  String? body;

  CreatePostModel({
    this.userId,
    this.title,
    this.body,
  });

  CreatePostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
