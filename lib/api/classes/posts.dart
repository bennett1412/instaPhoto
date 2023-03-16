// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    this.data,
  });

  List<Post>? data;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        data: json["data"] == null ? [] : List<Post>.from(json["data"]!.map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Post {
  Post({
    this.id,
    required this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.updatedDate,
    this.owner,
  });

  String? id;
  String image;
  int? likes;
  List<String>? tags;
  String? text;
  DateTime? publishDate;
  DateTime? updatedDate;
  Owner? owner;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        image: json["image"],
        likes: json["likes"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        text: json["text"],
        publishDate: json["publishDate"] == null ? null : DateTime.parse(json["publishDate"]),
        updatedDate: json["updatedDate"] == null ? null : DateTime.parse(json["updatedDate"]),
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "likes": likes,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "text": text,
        "publishDate": publishDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "owner": owner?.toJson(),
      };
}

class Owner {
  Owner({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
  });

  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        title: json["title"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
        "picture": picture,
      };
}
