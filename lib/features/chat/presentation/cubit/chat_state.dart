part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatSendingMessage extends ChatState {}

class ChatSendMessageSuccess extends ChatState {
  final Message message;

  const ChatSendMessageSuccess(this.message);
}

class ChatSendMessageFailure extends ChatState {
  final String errMessage;

  const ChatSendMessageFailure(this.errMessage);
}
