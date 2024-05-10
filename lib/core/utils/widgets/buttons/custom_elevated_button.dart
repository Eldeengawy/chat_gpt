// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mohtm/core/extensions/txt_theme.dart';
// import 'package:mohtm/core/static/lottie.dart';
// import 'package:mohtm/core/theme/colors.dart';

// class CustomElevatedButton extends StatelessWidget {
//   final String title;
//   final bool isFilled;
//   final bool loading;
//   final void Function() onPressed;
//   const CustomElevatedButton({
//     super.key,
//     required this.title,
//     this.isFilled = true,
//     required this.onPressed,
//     this.loading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? SizedBox(height: 100, child: Lottie.asset(AppAnimations.ai))
//         : SizedBox(
//             width: double.infinity,
//             // height: 44.h,
//             child: ElevatedButton(
//               onPressed: loading ? () {} : onPressed,
//               style: ElevatedButton.styleFrom(
//                 // minimumSize: Size(50.w, 44.h),
//                 elevation: 0.0,
//                 foregroundColor: isFilled ? AppColors.white : AppColors.primary,
//                 backgroundColor: isFilled ? AppColors.primary : AppColors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   side: const BorderSide(color: AppColors.primary, width: 1),
//                 ),
//                 // padding:
//                 //     const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
//               ),
//               child: Text(title.tr(),
//                   style: context.theme.textTheme.bodyLarge!.copyWith(
//                     color: isFilled ? AppColors.white : AppColors.primary,
//                     fontWeight: FontWeight.bold,
//                   )),
//             ),
//           );
//   }
// }

import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Assuming you have imported other necessary dependencies

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final bool isFilled;
  final bool? boldTitle;
  final bool loading;
  final String? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final double? height;

  const CustomElevatedButton({
    super.key,
    required this.title,
    this.isFilled = true,
    required this.onPressed,
    this.height = 60,
    this.icon,
    this.iconColor = AppColors.white,
    this.backgroundColor = AppColors.primary,
    this.textColor,
    this.loading = false,
    this.boldTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height?.h ?? 48.h,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: !isFilled
                ? Border.all(
                    color: AppColors.primary,
                    width: 2,
                  )
                : null,
            color: isFilled ? backgroundColor : Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: loading
              ? SpinKitThreeBounce(
                  color: iconColor,
                  size: 25,
                )
              : FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          title.tr(),
                          textAlign: TextAlign.center,
                          // textScaleFactor: 0.5,
                          style: AppStyles.bold18white,
                        ),
                      ),
                      if (icon != null) ...[
                        12.pw,
                        SvgPicture.asset(
                          icon!,
                          colorFilter:
                              ColorFilter.mode(iconColor!, BlendMode.srcIn),
                        ),
                      ],
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
