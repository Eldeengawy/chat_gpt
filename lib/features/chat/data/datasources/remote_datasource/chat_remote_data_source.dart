import 'package:chat_gpt/features/chat/data/models/message.dart';

abstract class ChatsRemoteDataSource {
  Future<Message> sendMessage(Message message, String chatId);
}
