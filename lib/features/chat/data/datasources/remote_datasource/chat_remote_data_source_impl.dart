import 'package:chat_gpt/core/api/end_points.dart';
import 'package:chat_gpt/features/chat/data/datasources/remote_datasource/chat_remote_data_source.dart';
import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatsRemoteDataSourceImpl implements ChatsRemoteDataSource {
  @override
  Future<Message> sendMessage(Message message,String chatId) async {
    final model =
        GenerativeModel(model: 'gemini-pro', apiKey: EndPoints.geminiApi);
    final content = [Content.text(message.text)];
    final response = await model.generateContent(content);

    return Message(
      text: response.text ?? '',
      isSentByMe: false,
      id: '',
    );
  }
}
