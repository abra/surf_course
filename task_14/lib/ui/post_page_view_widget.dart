import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/post.dart';

class PostPageViewWidget extends StatefulWidget {
  const PostPageViewWidget({
    super.key,
    required this.postId,
    required this.posts,
  });

  final int postId;
  final List<Post> posts;

  @override
  State<PostPageViewWidget> createState() => _PostPageViewWidgetState();
}

class _PostPageViewWidgetState extends State<PostPageViewWidget> {
  late int _currentPost;
  late List<Post> _posts;
  late PageController _pageController;

  void _onPageChanged() {
    final prevPage = _currentPost;
    _currentPost = _pageController.page?.round() ?? _currentPost;
    if (prevPage != _currentPost) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _currentPost = widget.postId - 1;
    _posts = widget.posts;
    _pageController = PageController(
      initialPage: _currentPost,
      viewportFraction: 0.75,
    );
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: const Color(0xFF222222),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Text(
                    '${_currentPost + 1}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '/${_posts.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _posts.length,
        itemBuilder: (_, index) {
          return AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: _currentPost == index ? 1 : 0.85,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 60.0,
              ),
              child: GestureDetector(
                onTap: () => _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                ),
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image: AssetImage(_posts[index].path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
