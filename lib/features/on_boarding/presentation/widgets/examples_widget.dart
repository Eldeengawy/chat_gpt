import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/features/on_boarding/presentation/widgets/text_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExamplesWidget extends StatelessWidget {
  const ExamplesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppIcons.examples),
        13.ph,
        Text(
          'Examples',
          style: AppStyles.medium20white,
          textAlign: TextAlign.center,
        ),
        40.ph,
        Column(
          children: [
            const TextCardWidget(
              text: '“Explain quantum computing in\nsimple terms”',
            ),
            16.ph,
            const TextCardWidget(
              text: '“Got any creative ideas for a 10\nyear old’s birthday?”',
            ),
            16.ph,
            const TextCardWidget(
              text: '“How do I make an HTTP request\nin Javascript?”',
            ),
            16.ph,
          ],
        ),
      ],
    );
  }
}
