import 'dart:convert';

import 'package:http/http.dart' as http;

import 'message_entity.dart';
import 'messages_repository.dart';

class RemoteApiRepositoryImpl implements MessagesRepository {
  @override
  Future<MessageEntity> getMessage() async {
    final response = await http.get(
      Uri.parse('https://eightballapi.com/api'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return MessageEntity(data['reading']);
    } else {
      throw Exception();
    }
  }
}
