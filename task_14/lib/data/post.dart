class Post {
  final int post;
  final String path;

  Post({
    required this.post,
    required this.path,
  });

  static fromJson(e) {
    return Post(
      post: e['post'],
      path: e['file'],
    );
  }

  @override
  String toString() {
    return 'Post{post: $post, path: $path}';
  }
}
