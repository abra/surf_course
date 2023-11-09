import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/post.dart';
import 'post_page_view_widget.dart';

class PostsGridViewWidget extends StatelessWidget {
  const PostsGridViewWidget({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 34,
          child: Image.asset(appLogoPath),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPageViewWidget(
                      postId: posts[index].id,
                      posts: posts,
                    ),
                  ),
                );
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
