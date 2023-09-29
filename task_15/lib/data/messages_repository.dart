import 'message_entity.dart';

abstract interface class MessagesRepository {
  Future<MessageEntity> getMessage();
}
