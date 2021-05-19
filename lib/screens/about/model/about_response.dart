// To parse this JSON data, do
//
//     final aboutResponse = aboutResponseFromJson(jsonString);

import 'dart:convert';

AboutResponse aboutResponseFromJson(String str) => AboutResponse.fromJson(json.decode(str));

String aboutResponseToJson(AboutResponse data) => json.encode(data.toJson());

class AboutResponse {
  AboutResponse({
    this.posts,
  });

  List<Post> posts;

  factory AboutResponse.fromJson(Map<String, dynamic> json) => AboutResponse(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.type,
    this.title,
    this.body,
  });

  int id;
  String type;
  String title;
  String body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    type: json["type"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "title": title,
    "body": body,
  };
}
