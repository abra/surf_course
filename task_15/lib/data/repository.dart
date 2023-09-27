import 'message_entity.dart';

abstract interface class Repository {
  Future<MessageEntity> getMessage();
}
