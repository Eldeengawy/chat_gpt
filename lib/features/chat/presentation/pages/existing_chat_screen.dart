import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/services/di.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/core/utils/widgets/buttons/custom_icon_button.dart';
import 'package:chat_gpt/core/utils/widgets/inputs/custom_form_field.dart';
import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:chat_gpt/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/message_widget.dart';
import 'package:chat_gpt/features/drawer/data/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ExistingChatScreen extends StatefulWidget {
  final Chat chat;
  const ExistingChatScreen({super.key, required this.chat});

  @override
  State<ExistingChatScreen> createState() => _ExistingChatScreenState();
}

class _ExistingChatScreenState extends State<ExistingChatScreen> {
  List<Message> messages = [];
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    messages = widget.chat.messages.reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChatCubit(sl()),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 200,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: isDarkMode(context)
                  ? AppColors.white.withOpacity(0.4)
                  : AppColors.black.withOpacity(0.4),
              height: 1.0,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.keyboard_arrow_left_rounded,
                  ),
                  12.pw,
                  Text(
                    'Back',
                    style: AppStyles.semiBold15white.copyWith(
                        color: isDarkMode(context)
                            ? AppColors.white
                            : AppColors.black),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(
                AppIcons.logo,
                height: 24,
                colorFilter: ColorFilter.mode(
                    isDarkMode(context) ? AppColors.white : AppColors.black,
                    BlendMode.srcIn),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (messages.isEmpty) ...[
                Expanded(
                  child: Center(
                    child: Text(
                      'Ask anything, get your answer',
                      style: AppStyles.semiBold15white.copyWith(
                        fontSize: 16.r,
                        color: isDarkMode(context)
                            ? AppColors.white.withOpacity(0.4)
                            : AppColors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                )
              ],
              if (messages.isNotEmpty)

                // Your existing content here
                Flexible(
                  child: ListView.builder(
                    itemCount: messages.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return BlocBuilder<ChatCubit, ChatState>(
                        builder: (BuildContext context, ChatState state) =>
                            MessageWidget(
                          message: messages[index],
                          chatId: widget.chat.id,
                          onRegenerate: () {
                            ChatCubit.get(context).regenerateAnswer(
                                widget.chat.id, messages[index + 1]);
                          },
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
              // Add the TextFormField
              CustomTextFormField(
                controller: messageController,
                suffixIC: BlocConsumer<ChatCubit, ChatState>(
                  builder: (BuildContext context, ChatState state) =>
                      CustomIconButton(
                    color: AppColors.primary,
                    iconAsset: AppIcons.send,
                    onPressed: () async {
                      final message = messageController.text;
                      messageController.clear();
                      setState(() {
                        messages.insert(0,
                            Message(text: message, isSentByMe: true, id: '0'));
                      });
                      ChatCubit.get(context).sendMessage(
                          Message(id: '0', text: message, isSentByMe: true),
                          widget.chat.id);
                    },
                  ),
                  listener: (BuildContext context, ChatState state) {
                    if (state is ChatSendMessageSuccess) {
                      setState(() {
                        messages.insert(
                          0,
                          Message(
                              text: state.message.text,
                              isSentByMe: false,
                              id: '0'),
                        );
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
