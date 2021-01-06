import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:swamedia_test/src/models/post-model.dart';

class PostService {
  int limit = 10;

  Future<List<PostModel>> fetchPosts([int offset = 0]) async {
    String apiUrl =
        'https://jsonplaceholder.typicode.com/posts?_start=$offset&_limit=$limit';

    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      return compute(postModelFromJson, response.body);
    }
    throw Exception('error fetching posts');
  }

  Future<PostModel> getPost(int id) async {
    final response = await http.get(
      'https://jsonplaceholder.typicode.com/posts/$id',
    );
    if (response.statusCode == 200) {
      print(response.body);
      return compute(bookmarkModelFromJson, response.body);
    }
    throw Exception('error fetching posts');
  }

  Future<List<PostModel>> getListPost() async {
    final uriApi = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(uriApi);

    if (response.statusCode == 200) {
      return compute(postModelFromJson, response.body);
    }
    throw Exception('error fetching posts');
  }
}
