import 'dart:developer';

import 'package:chat_gpt/core/static/constants.dart';
import 'package:chat_gpt/features/chat/data/datasources/locale_datasource/chats_local_data_source.dart';
import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:chat_gpt/features/drawer/data/models/chat.dart';
import 'package:hive/hive.dart';

class ChatsLocalDataSourceImpl implements ChatsLocalDataSource {
  @override
  Future<void> saveChat(String chatId, Message message) async {
    final chatBox = Hive.box(Constants.KChatBox); // Open the box
    final Chat? existingChat;
    existingChat = chatBox.values.firstWhere((element) => element.id == chatId,
        orElse: () {
      log('No existing chat');
    });
    if (existingChat != null) {
      existingChat.messages.add(message);
      await existingChat.save();
    } else {
      chatBox.add(
        Chat(
          id: chatId,
          title: message.text,
          time: DateTime.now.toString(),
          messages: [message],
        ),
      );
    }
    getChats();
  }

  @override
  Future<List<Chat>> getChats() async {
    // Open the box that holds Chat objects
    final chatBox = Hive.box(Constants.KChatBox); // Open the box

    // Retrieve all chats from the box and cast them to a List<Chat>
    List<Chat> chats = chatBox.values.cast<Chat>().toList();

    // Return the list of chats
    return chats;
  }

  @override
  Future<void> deleteAllChats() async {
    final chatBox = Hive.box(Constants.KChatBox);
    await chatBox.clear(); // Clear the box
  }

  @override
  Future<void> deleteChat(String chatId) async {
    final chatBox = Hive.box(Constants.KChatBox);
    final Chat? existingChat;
    existingChat = chatBox.values.firstWhere((element) => element.id == chatId,
        orElse: () {
      log('No existing chat');
    });
    if (existingChat != null) {
      existingChat.messages.clear();
      await existingChat.delete();
    } else {
      log('No existing chat');
    }
  }

  @override
  Future<void> removeLastMessage(String chatId) async {
    final chatBox = Hive.box(Constants.KChatBox);
    final Chat? existingChat = chatBox.values.firstWhere(
      (element) => element.id == chatId,
      orElse: () {
        log('No existing chat');
        return null;
      },
    );

    if (existingChat != null && existingChat.messages.isNotEmpty) {
      // Remove the last message
      existingChat.messages.removeLast();
      // Save the chat
      await existingChat.save();
    } else {
      log('No existing chat or no messages to remove');
    }
  }
}
