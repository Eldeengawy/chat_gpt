import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: AppColors.white,
      iconColor: AppColors.white,
      title: Text(question, style: AppStyles.bold18white),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Text(answer, style: AppStyles.medium16white),
        ),
      ],
    );
  }
}
