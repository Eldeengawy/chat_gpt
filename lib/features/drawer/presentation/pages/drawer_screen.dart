import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/new_chat_widget.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/settings_item.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black20,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  NewChatWidget(),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.white.withOpacity(0.4),
                  ),
                ),
              ),
              child: const Column(
                children: [
                  SettingsItem(
                    title: 'Clear conversations',
                    icon: AppIcons.trash,
                  ),
                  SettingsItem(
                    title: 'Upgrade to plus',
                    icon: AppIcons.person,
                    isNew: true,
                  ),
                  SettingsItem(
                    title: 'Light mode',
                    icon: AppIcons.lightMode,
                  ),
                  SettingsItem(
                    title: 'Updates & FAQ',
                    icon: AppIcons.updates,
                  ),
                  SettingsItem(
                    title: 'Logout',
                    icon: AppIcons.logout,
                    color: AppColors.redED,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
