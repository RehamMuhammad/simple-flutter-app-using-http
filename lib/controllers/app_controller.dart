import 'dart:convert';

import 'package:json_api_example/models/post.dart';
import 'package:json_api_example/models/comment.dart';
import 'package:http/http.dart' as http;

class AppContrloller {
  static Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    return List<Post>.from(
        jsonDecode(response.body).map((e) => Post.fromJson(e)));
  }


    static Future<List<Comment>> getComments(int postId) async {
      
    final res =
        await http.get(Uri.parse('http://jsonplaceholder.typicode.com/comments?postId=$postId'));

    return List<Comment>.from(
        jsonDecode(res.body).map((com) => Comment.fromJson(com)));
  }
}
