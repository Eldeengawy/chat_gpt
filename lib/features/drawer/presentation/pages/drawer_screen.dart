import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/chats_history.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/new_chat_widget.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // This enables system back gestures
      onPopInvoked: (didPop) {
        if (!didPop) {
          // System back gesture was not handled by any route
          _showCloseMessage();
        }
      },
      child: Scaffold(
        backgroundColor:
            isDarkMode(context) ? AppColors.black20 : AppColors.white,
        body: const SafeArea(
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
      ),
    );
  }

  void _showCloseMessage() {
    if (currentBackPressTime == null ||
        DateTime.now().difference(currentBackPressTime!) >
            const Duration(seconds: 2)) {
      currentBackPressTime = DateTime.now();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tap back again to close ChatGPT'),
        ),
      );
    } else {
      SystemNavigator.pop();
    }
  }
}
