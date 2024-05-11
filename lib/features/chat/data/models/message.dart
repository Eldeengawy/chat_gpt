
import 'package:hive/hive.dart';

part 'message.g.dart';

@HiveType(typeId: 1)
class Message extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String text;

  @HiveField(2)
  late bool isSentByMe;

  Message({
    required this.id,
    required this.text,
    required this.isSentByMe,
  });
}
