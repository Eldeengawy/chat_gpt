import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:chat_gpt/features/chat/domain/repositories/chats_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatsRepo chatsRepo;
  ChatCubit(this.chatsRepo) : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  Future<void> sendMessage(Message message, String chatId) async {
    try {
      emit(ChatSendingMessage());

      // Attempt to send the message
      Message botMessage =  await chatsRepo.sendMessage(message, chatId);

      // If successful, emit success event
      emit(ChatSendMessageSuccess(botMessage));
    } catch (error) {
      // If an error occurs, emit an error event
      emit(ChatSendMessageFailure(error.toString()));
    }
  }
}
