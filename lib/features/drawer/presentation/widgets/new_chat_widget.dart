import 'package:chat_gpt/config/routes/routes.dart';
import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NewChatWidget extends StatelessWidget {
  const NewChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.newChat);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom:
                BorderSide(color: AppColors.white.withOpacity(0.4), width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.chat,
                ),
                16.pw,
                Text(
                  'New Chat',
                  style: AppStyles.bold16white,
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
