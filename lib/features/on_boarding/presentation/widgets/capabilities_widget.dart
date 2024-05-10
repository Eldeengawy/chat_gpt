import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/features/on_boarding/presentation/widgets/text_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CapabilitiesWidget extends StatelessWidget {
  const CapabilitiesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppIcons.capabilities),
        13.ph,
        Text(
          'Capabilities',
          style: AppStyles.medium20white,
          textAlign: TextAlign.center,
        ),
        40.ph,
        Column(
          children: [
            const TextCardWidget(
              text: 'Remembers what user said earlier\nin the conversation',
            ),
            16.ph,
            const TextCardWidget(
              text: 'Allows user to provide follow-up\ncorrections',
            ),
            16.ph,
            const TextCardWidget(
              text: 'Trained to decline inappropriate\nrequests',
            ),
            16.ph,
          ],
        ),
      ],
    );
  }
}
