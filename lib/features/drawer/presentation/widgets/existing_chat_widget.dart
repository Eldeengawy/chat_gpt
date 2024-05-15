import 'package:chat_gpt/config/routes/routes.dart';
import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/functions/show_settings_menu.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/features/drawer/data/models/chat.dart';
import 'package:chat_gpt/features/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ExistingChatWidget extends StatelessWidget {
  final Chat chat;
  const ExistingChatWidget({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.existingChat, extra: chat);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: isDarkMode(context)
                    ? AppColors.white.withOpacity(0.4)
                    : AppColors.black.withOpacity(0.4),
                width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.chat,
                    colorFilter: ColorFilter.mode(
                        isDarkMode(context) ? AppColors.white : AppColors.black,
                        BlendMode.srcIn),
                  ),
                  16.pw,
                  Expanded(
                    child: Text(
                      chat.title,
                      style: AppStyles.bold16white.copyWith(
                          color: isDarkMode(context)
                              ? AppColors.white
                              : AppColors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      showSettingsMenu(context, details.globalPosition,
                          () => DrawerCubit.get(context).deleteChat(chat.id));
                    },
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                          AppIcons.menu,
                          colorFilter: ColorFilter.mode(
                              isDarkMode(context)
                                  ? AppColors.white
                                  : AppColors.black,
                              BlendMode.srcIn),
                        ))),
                20.pw,
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color:
                      isDarkMode(context) ? AppColors.white : AppColors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
