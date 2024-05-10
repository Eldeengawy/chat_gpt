import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/core/utils/widgets/buttons/custom_icon_button.dart';
import 'package:chat_gpt/core/utils/widgets/inputs/custom_form_field.dart';
import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: AppColors.white.withOpacity(0.4),
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
                  style: AppStyles.semiBold15white
                      .copyWith(color: AppColors.white),
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
                      color: AppColors.white.withOpacity(0.4),
                    ),
                  ),
                ),
              )
            ],
            if (messages.isNotEmpty)

              // Your existing content here
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return MessageWidget(message: messages[index]);
                  },
                ),
              ),
            // Add the TextFormField
            CustomTextFormField(
              controller: TextEditingController(),
              suffixIC: CustomIconButton(
                color: AppColors.primary,
                iconAsset: AppIcons.send,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample list of messages
List<Message> messages = [
  Message(text: 'Hey there!', isSentByMe: false),
  Message(text: 'Hi! How are you?', isSentByMe: true),
  Message(
      text:
          'The sky appears blue because of the scattering of sunlight by Earth\'s atmosphere. As sunlight enters the atmosphere, it encounters tiny molecules of gas and other particles in the air. These particles scatter the light in all directions. However, blue light is scattered more than other colors because it travels in smaller, shorter waves. This is known as Rayleigh scattering.',
      isSentByMe: false),
  Message(text: 'Hey there!', isSentByMe: false),
  Message(text: 'Hi! How are you?', isSentByMe: true),
  Message(
      text:
          'The sky appears blue because of the scattering of sunlight by Earth\'s atmosphere. As sunlight enters the atmosphere, it encounters tiny molecules of gas and other particles in the air. These particles scatter the light in all directions. However, blue light is scattered more than other colors because it travels in smaller, shorter waves. This is known as Rayleigh scattering.',
      isSentByMe: false),
  Message(text: 'Hey there!', isSentByMe: false),
  Message(text: 'Hi! How are you?', isSentByMe: true),
  Message(
      text:
          'The sky appears blue because of the scattering of sunlight by Earth\'s atmosphere. As sunlight enters the atmosphere, it encounters tiny molecules of gas and other particles in the air. These particles scatter the light in all directions. However, blue light is scattered more than other colors because it travels in smaller, shorter waves. This is known as Rayleigh scattering.',
      isSentByMe: false),
];
