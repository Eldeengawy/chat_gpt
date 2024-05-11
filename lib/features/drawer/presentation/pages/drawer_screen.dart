import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/chats_history.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/new_chat_widget.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black20,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  NewChatWidget(),
                ],
              ),
            ),
            Expanded(
              child: ChatsHistoryWidget(),
            ),
            SettingsWidget(),
          ],
        ),
      ),
    );
  }
}
