import 'dart:convert';

import 'package:flutter/services.dart';

import '../constants.dart';
import 'post.dart';
import 'posts_data_interface.dart';

class PostRepositoryImpl implements PostsDataInterface {
  final List<Post> _posts = [];

  @override
  Future<List<Post>> getPosts() async {
    final data = await rootBundle.loadString(jsonDataPath);

    for (var e in json.decode(data)) {
      _posts.add(Post.fromJson(e));
    }

    await Future.delayed(const Duration(seconds: 1));
    return _posts;
  }
}
