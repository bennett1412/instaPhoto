import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:insta_photo/api/classes/posts.dart';

class URLS {
  static const String baseUrl = 'https://dummyapi.io/data/v1/';
}

class APIService {
  Future<List<Post>?> fetchPosts(int page) async {
    // add sample api response
    print('making api call');
    try {
      final response = await http.get(
        Uri.parse('${URLS.baseUrl}/post?page=$page&limit=10'),
        headers: {"app-id": "6411d1c862f48645f1dd8cf1"},
      );
      if (response.statusCode == 200) {
        Posts res = postsFromJson(response.body);
        print(res.data.toString());
        return res.data;
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
// 6411d1c862f48645f1dd8cf1
// remove cmake shit
// add api fetch 
// add infinite scroll
// add oauth
// add save bookmarked photos 
// add a different page for bm photos