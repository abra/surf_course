import 'post.dart';

abstract interface class PostsDataInterface {
  Future<List<Post>> getPosts();
}
