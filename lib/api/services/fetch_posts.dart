import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:insta_photo/api/classes/posts.dart';

class URLS {
  static const String baseUrl = 'https://dummyapi.io/data/v1/';
}

class APIService {
  Future<List<Post>?> fetchPosts(int page) async {
    // getting posts
    try {
      final response = await http.get(
        Uri.parse('${URLS.baseUrl}/post?page=$page&limit=10'),
        headers: {"app-id": "6411d1c862f48645f1dd8cf1"},
      );
      if (response.statusCode == 200) {
        Posts res = postsFromJson(response.body);
        return res.data;
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());
        return null;
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
  }
}
