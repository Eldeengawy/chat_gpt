import 'package:chat_gpt/features/chat/data/datasources/locale_datasource/chats_local_data_source.dart';
import 'package:chat_gpt/features/drawer/data/models/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  final ChatsLocalDataSource chatsLocalDataSource;
  DrawerCubit(this.chatsLocalDataSource) : super(DrawerInitial());

  static DrawerCubit get(context) => BlocProvider.of(context);

  Future<void> getChats() async {
    emit(LoadingChats());
    try {
      List<Chat> chats = await chatsLocalDataSource.getChats();
      List<Chat> reversedChats = chats.reversed.toList();
      emit(ChatsLoaded(reversedChats));
    } catch (e) {
      emit(ChatsLoadingFailure(e.toString()));
    }
  }

  Future<void> deleteAllChats() async {
    emit(DeletingAllChats());
    try {
      await chatsLocalDataSource.deleteAllChats();
      emit(AllChatsDeleted());
    } catch (e) {
      emit(DeleteAllChatsFailure(e.toString()));
    }
  }

  Future<void> deleteChat(String chatId) async {
    // emit(DeletingChat());
    try {
      await chatsLocalDataSource.deleteChat(chatId);
      // emit(ChatDeleted());
      getChats();
    } catch (e) {
      emit(DeleteChatFailure(e.toString()));
    }
  }
}
