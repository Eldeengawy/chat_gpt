part of 'drawer_cubit.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object> get props => [];
}

class DrawerInitial extends DrawerState {}

class LoadingChats extends DrawerState {}

class ChatsLoaded extends DrawerState {
  final List<Chat> chats;

  const ChatsLoaded(this.chats);
}

class ChatsLoadingFailure extends DrawerState {
  final String errMessage;

  const ChatsLoadingFailure(this.errMessage);
}


class DeletingChat extends DrawerState {}

class ChatDeleted extends DrawerState {}
class DeleteChatFailure extends DrawerState {
  final String errMessage;

  const DeleteChatFailure(this.errMessage);
}

class DeletingAllChats extends DrawerState {}

class AllChatsDeleted extends DrawerState {}
class DeleteAllChatsFailure extends DrawerState {
  final String errMessage;

  const DeleteAllChatsFailure(this.errMessage);
}
