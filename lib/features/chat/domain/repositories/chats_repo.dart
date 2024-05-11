import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:chat_gpt/features/drawer/data/models/chat.dart';

abstract class ChatsRepo {
  Future<Message> sendMessage(Message message, String chatId);

  Future<void> removeLastMessage(String chatId);

  Future<void> saveChat(String chatId, Message message);
  Future<List<Chat>> getChats();
  Future<void> deleteChat(String chatId);
  Future<void> deleteAllChats();
}
