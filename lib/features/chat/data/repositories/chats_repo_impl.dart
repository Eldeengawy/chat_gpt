import 'dart:developer';

import 'package:chat_gpt/features/chat/data/datasources/locale_datasource/chats_local_data_source.dart';
import 'package:chat_gpt/features/chat/data/datasources/remote_datasource/chat_remote_data_source.dart';
import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:chat_gpt/features/chat/domain/repositories/chats_repo.dart';
import 'package:chat_gpt/features/drawer/data/models/chat.dart';

class ChatsRepoImpl implements ChatsRepo {
  final ChatsRemoteDataSource _remoteDataSource;
  final ChatsLocalDataSource _localDataSource;

  ChatsRepoImpl(this._remoteDataSource, this._localDataSource);
  @override
  Future<List<Chat>> getChats() async {
    return await _localDataSource.getChats();
  }

  @override
  Future<void> saveChat(String chatId, Message message) async {
    await _localDataSource.saveChat(chatId, message);
  }

  @override
  Future<Message> sendMessage(Message message, String chatId) async {
    // Log: Start sending message
    log('Sending message: $message to chat ID: $chatId');

    // Save user message
    await saveChat(chatId, message);

    // Log: User message saved
    log('User message saved to chat ID: $chatId');

    // Send message to remote data source (e.g., API)
    Message botMessage = await _remoteDataSource.sendMessage(message, chatId);

    // Log: Received bot message
    log('Received bot message: $botMessage');

    // Save bot message
    await saveChat(chatId, botMessage);

    // Log: Bot message saved
    log('Bot message saved to chat ID: $chatId');

    // Return bot message
    return botMessage;
  }

  @override
  Future<void> deleteAllChats() async {
    return await _localDataSource.deleteAllChats();
  }

  @override
  Future<void> deleteChat(String chatId) async {
    return await _localDataSource.deleteChat(chatId);
  }

  @override
  Future<void> removeLastMessage(String chatId) async {
    return await _localDataSource.removeLastMessage(chatId);
  }
}
