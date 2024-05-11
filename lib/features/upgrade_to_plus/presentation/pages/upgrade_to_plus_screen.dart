import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:chat_gpt/features/upgrade_to_plus/presentation/widgets/feature_widget.dart';
import 'package:flutter/material.dart';

class UpgradeToPlusScreen extends StatelessWidget {
  const UpgradeToPlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black10,
      appBar: AppBar(
        backgroundColor: AppColors.black10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ChatGPT Plus',
              style: AppStyles.bold32white,
            ),
            5.ph,
            Text(
              'Access out most powerful model and advanced features',
              style: AppStyles.medium16white,
            ),
            30.ph,
            const FeatureWidget(
              title: 'Full access to all out models\nGPT-4, GP-T3.5',
            ),
            20.ph,
            const FeatureWidget(
              title:
                  'Full access to advanced features\nAdvanced data analysis, vision, web browser, and file uploads',
            ),
            20.ph,
            const FeatureWidget(
              title: 'DALL-E image generation',
            ),
            20.ph,
            const FeatureWidget(
              title: 'Create and use custom GPTs',
            ),
            const Spacer(),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Auto-renews for EGP 699.99/month until canceled',
                    style: AppStyles.semiBold12white,
                  ),
                  CustomElevatedButton(
                    backgroundColor: AppColors.white,
                    textColor: AppColors.black,
                    title: 'Subscribe',
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
