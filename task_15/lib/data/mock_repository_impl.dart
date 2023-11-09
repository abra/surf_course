import 'dart:math';

import 'message_entity.dart';
import 'messages_repository.dart';

class MockRepositoryImpl implements MessagesRepository {
  @override
  Future<MessageEntity> getMessage() async {
    await Future.delayed(const Duration(seconds: 4));
    final messages = [
      'Не переживай, все будет хорошо.',
      'Доверься своей интуиции.',
      'Попробуй поставить более ясные цели.',
      'Не торопись с решениями, подумай хорошенько.',
      'Используй свой опыт для принятия решений.',
      'Сосредоточься на самом важном в этот момент.',
      'Поддерживай позитивный настрой и верь в себя.',
      'Задай конкретный вопрос, чтобы получить ясный ответ.',
      'Избегай отрицательных людей и влияний.',
      'Не забывай о здоровье и самоуходе.',
    ];
    final message = messages[Random().nextInt(messages.length)];
    return Future.value(MessageEntity(message));
  }
}
