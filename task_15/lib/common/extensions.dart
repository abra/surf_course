import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/common/dependency_container.dart';
import 'package:surf_flutter_courses_template/data/messages_repository.dart';
import 'package:surf_flutter_courses_template/data/remote_api_repository_impl.dart';

extension DependencyContainerExtension on BuildContext {
  MessagesRepository get messagesRepository {
    DependencyContainer.register(RemoteApiRepositoryImpl());
    return DependencyContainer.get<RemoteApiRepositoryImpl>();
  }

}