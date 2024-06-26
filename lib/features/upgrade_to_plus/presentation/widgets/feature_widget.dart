import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class FeatureWidget extends StatelessWidget {
  final String title;
  const FeatureWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          color: isDarkMode(context) ? AppColors.white : AppColors.black,
        ),
        20.pw,
        Expanded(
          child: Text(
            title,
            style: AppStyles.medium16white.copyWith(
                color: isDarkMode(context) ? AppColors.white : AppColors.black),
          ),
        ),
      ],
    );
  }
}
