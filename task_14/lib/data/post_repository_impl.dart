import 'dart:convert';

import 'package:flutter/services.dart';

import 'post.dart';
import 'repository.dart';

class PostRepositoryImpl implements Repository {
  @override
  Future<List<Post>> getPosts() async {
    final data = await rootBundle.loadString('assets/json/images.json');

    List<Post> posts = [];

    for (var e in json.decode(data)) {
      posts.add(Post.fromJson(e));
    }

    await Future.delayed(const Duration(seconds: 2));
    return posts;
  }
}
