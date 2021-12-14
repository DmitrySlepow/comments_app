import 'dart:convert';

import 'package:comments_app/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentsDataProvider {
  var client = http.Client();

  Future<List<Comment>> fetchComments() async {
    final response = await client.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/comments',
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return Comment.fromJson(json);
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
