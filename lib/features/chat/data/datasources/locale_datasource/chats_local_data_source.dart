import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:chat_gpt/features/drawer/data/models/chat.dart';

abstract class ChatsLocalDataSource {
  Future<void> saveChat(String chatId, Message message);
  Future<List<Chat>> getChats();
  Future<void> deleteChat(String chatId);
  Future<void> deleteAllChats();
  Future<void> removeLastMessage(String chatId);
}
