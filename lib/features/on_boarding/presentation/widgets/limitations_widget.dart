import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/features/on_boarding/presentation/widgets/text_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LimitationsWidget extends StatelessWidget {
  const LimitationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppIcons.limitations,
          colorFilter: ColorFilter.mode(
              isDarkMode(context) ? AppColors.white : AppColors.black,
              BlendMode.srcIn),
        ),
        13.ph,
        Text(
          'Limitations',
          style: AppStyles.medium20white.copyWith(
              color: isDarkMode(context) ? AppColors.white : AppColors.black),
          textAlign: TextAlign.center,
        ),
        40.ph,
        Column(
          children: [
            const TextCardWidget(
              text: 'May occasionally generate\nincorrect information',
            ),
            16.ph,
            const TextCardWidget(
              text:
                  'May occasionally produce harmful\ninstructions or biased content',
            ),
            16.ph,
            const TextCardWidget(
              text: 'Limited knowledge of world and\nevents after 2021',
            ),
            16.ph,
          ],
        ),
      ],
    );
  }
}
