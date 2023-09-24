import 'post.dart';

abstract interface class Repository {
  Future<List<Post>> getPosts();
}
