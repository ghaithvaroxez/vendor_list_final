// To parse this JSON data, do
//
//     final about = aboutFromJson(jsonString);

import 'dart:convert';

About aboutFromJson(String str) => About.fromJson(json.decode(str));

String aboutToJson(About data) => json.encode(data.toJson());

class About {
  About({
    this.posts,
    this.addresses,
  });

  List<Post> posts;
  List<Address> addresses;

  factory About.fromJson(Map<String, dynamic> json) => About(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    this.id,
    this.value,
    this.latitude,
    this.longitude,
  });

  int id;
  String value;
  String latitude;
  String longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    value: json["value"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "latitude": latitude,
    "longitude": longitude,
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
