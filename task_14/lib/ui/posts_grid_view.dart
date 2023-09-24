import 'dart:developer';

import 'package:flutter/material.dart';

import '../data/post.dart';
import 'constants.dart';

class PostsGridView extends StatelessWidget {
  const PostsGridView({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 34,
          child: Image.asset(appLogo),
        ),
      ),
      body: GridView.builder(
        itemCount: posts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                log(posts[index].path);
              },
              child: Image.asset(
                posts[index].path,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
