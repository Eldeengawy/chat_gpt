import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Define a typedef for the delete function
// typedef DeleteFunction = Future<void>;
void showSettingsMenu(
  BuildContext context,
  Offset tapPosition,
  Future<void> Function() onDelete,
) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      tapPosition,
      tapPosition, // To show the menu at the tapped position
    ),
    overlay.localToGlobal(Offset.zero) & overlay.size,
  );

  showMenu(
    color: isDarkMode(context) ? AppColors.grey34 : AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0.r),
      ),
    ),
    context: context,
    position: position,
    items: <PopupMenuEntry>[
      PopupMenuItem(
        value: 'edit',
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.edit,
              width: 16.r,
              height: 16.r,
              colorFilter: ColorFilter.mode(
                  isDarkMode(context) ? AppColors.white : AppColors.black,
                  BlendMode.srcIn),
            ),
            10.pw,
            Text(
              'Edit',
              style: AppStyles.medium12white.copyWith(
                  color:
                      isDarkMode(context) ? AppColors.white : AppColors.black),
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 'delete',
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.trash,
              width: 16.r,
              height: 16.r,
              colorFilter:
                  const ColorFilter.mode(AppColors.redED, BlendMode.srcIn),
            ),
            10.pw,
            Text(
              'Delete',
              style: AppStyles.medium12white.copyWith(color: AppColors.redED),
            ),
          ],
        ),
      ),

      // Add more items as needed
    ],
    elevation: 8.0, // Adjust the elevation
  ).then((value) async {
    // Handle the selected option here
    if (value == 'edit') {
      // context.push(const PostReelScreenRoute());
    } else if (value == 'delete') {
      // Call the onDelete function when delete is selected
      await onDelete();
      // context.pushRoute(const PostJobScreenRoute());
    }
  });
}
