import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/functions/copy_text_to_clipboard.dart';
import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final String chatId;
  final void Function()? onRegenerate;
  final int index;

  const MessageWidget(
      {super.key,
      required this.message,
      required this.chatId,
      this.onRegenerate,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // constraints: BoxConstraints(maxWidth: Med),
        margin: const EdgeInsets.only(
          bottom: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.75,
              ),
              // width: MediaQuery.sizeOf(context).width * 0.75,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color:
                    message.isSentByMe ? AppColors.primary : AppColors.grey5D,
                borderRadius: message.isSentByMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
              ),
              child: Text(
                message.text,
                style: AppStyles.semiBold15white.copyWith(fontSize: 16.r),
              ),
            ),
            if (!message.isSentByMe) ...[
              12.ph,
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.like,
                    colorFilter: ColorFilter.mode(
                        isDarkMode(context)
                            ? AppColors.white.withOpacity(0.4)
                            : AppColors.black.withOpacity(0.4),
                        BlendMode.srcIn),
                  ),
                  18.pw,
                  SvgPicture.asset(
                    AppIcons.dislike,
                    colorFilter: ColorFilter.mode(
                        isDarkMode(context)
                            ? AppColors.white.withOpacity(0.4)
                            : AppColors.black.withOpacity(0.4),
                        BlendMode.srcIn),
                  ),
                  40.pw,
                  GestureDetector(
                    onTap: () {
                      copyToClipboard(context, message.text);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.copy,
                          colorFilter: ColorFilter.mode(
                              isDarkMode(context)
                                  ? AppColors.white.withOpacity(0.4)
                                  : AppColors.black.withOpacity(0.4),
                              BlendMode.srcIn),
                        ),
                        12.pw,
                        Text(
                          'copy',
                          style: AppStyles.semiBold15white.copyWith(
                            fontSize: 14.r,
                            color: isDarkMode(context)
                                ? AppColors.white.withOpacity(0.4)
                                : AppColors.black.withOpacity(0.4),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              if (index == 0) ...[
                40.ph,
                GestureDetector(
                  onTap: onRegenerate,
                  child: Center(
                      child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                    decoration: BoxDecoration(
                      color: AppColors.black20,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: AppColors.white.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppIcons.regenerate),
                        10.pw,
                        Text(
                          'Regenerate response',
                          style:
                              AppStyles.medium12white.copyWith(fontSize: 14.r),
                        ),
                      ],
                    ),
                  )),
                )
              ]
            ]
          ],
        ),
      ),
    );
  }
}
