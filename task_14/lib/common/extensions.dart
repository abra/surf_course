import 'package:flutter/cupertino.dart';
import 'package:surf_flutter_courses_template/data/posts_repository_impl.dart';

import './dependency_container.dart';
import '../data/posts_data_interface.dart';

extension DependencyContainerExtenstion on BuildContext {
  PostsDataInterface get postsRepository {
    DependencyContainer.register(PostsRepositoryImpl());
    return DependencyContainer.get<PostsRepositoryImpl>();
  }
}
