class Post {
  final int id;
  final String path;

  Post({
    required this.id,
    required this.path,
  });

  static fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      path: json['path'] as String,
    );
  }

  @override
  String toString() {
    return 'Post{id: $id, path: $path}';
  }
}
