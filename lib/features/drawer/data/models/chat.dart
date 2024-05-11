import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:hive/hive.dart';

part 'chat.g.dart';

@HiveType(typeId: 0)
class Chat extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String time;
  @HiveField(3)
  late List<Message> messages;

  Chat(
      {required this.id,
      required this.title,
      required this.time,
      required this.messages});
}
