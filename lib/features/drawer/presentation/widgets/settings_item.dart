import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String icon;
  final Color? color;
  final void Function()? onTap;
  final bool? isNew;
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.color = AppColors.white,
    this.isNew = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
                ),
                16.pw,
                Text(
                  title,
                  style: AppStyles.medium16white.copyWith(color: color),
                ),
              ],
            ),
            if (isNew!) ...[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.yellowFB,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'NEW',
                  style: AppStyles.semiBold12white
                      .copyWith(color: AppColors.green88),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
