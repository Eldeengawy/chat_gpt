import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TextCardWidget extends StatelessWidget {
  final String text;
  const TextCardWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 37.5),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: AppStyles.medium16white,
        textAlign: TextAlign.center,
      ),
    );
  }
}
