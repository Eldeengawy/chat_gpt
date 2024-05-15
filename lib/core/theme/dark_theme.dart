import 'package:chat_gpt/core/static/constants.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    // primaryColorLight: AppColors.primaryLight,
    // primaryColorDark: AppColors.primaryDark,
    //this may be changed in the future
    // useMaterial3: false,
    scaffoldBackgroundColor: AppColors.grey34,
    fontFamily: Constants.fontFamily,
    // colorScheme: const ColorScheme.dark(
    //     // primary: AppColors.primary,
    //     ),

    dividerColor: AppColors.white.withOpacity(0.4),
    dividerTheme: DividerThemeData(
        color: AppColors.white.withOpacity(0.4), thickness: 0.1),

    //! AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.grey34,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),

    //! Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 4.0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      // unselectedIconTheme: IconThemeData(color: AppColors.greyCB),
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        color: AppColors.primary,
        fontWeight: FontWeight.w400,
      ),
      // unselectedLabelStyle: TextStyle(
      //   fontSize: 12,
      //   color: AppColors.greyCB,
      //   fontWeight: FontWeight.w400,
      // ),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      // unselectedItemColor: AppColors.greyCB,
      enableFeedback: false,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    ),

    //! Buttons Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(color: AppColors.white, fontSize: 16),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0.0,
        alignment: Alignment.center,
        enableFeedback: false,
        padding: const EdgeInsets.symmetric(vertical: 19),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        elevation: 0.0,
        alignment: Alignment.center,
        enableFeedback: false,
      ),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        enableFeedback: true,
        iconSize: 20,
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      checkColor: MaterialStateProperty.all(AppColors.primary),
      fillColor: MaterialStateProperty.all(AppColors.primary.withOpacity(0.2)),
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    ),

    dropdownMenuTheme: const DropdownMenuThemeData(),

    //! Text Theme
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    //! BODY
    // bodyLarge: TextStyle(
    //   fontSize: 35.sp,
    //   fontStyle: FontStyle.normal,
    //   fontWeight: FontWeight.w900,
    //   color: AppColors.white,
    // ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    //! DISPLAY
    displayLarge: TextStyle(
      fontSize: 20.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 14.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    //! HEADLINE
    headlineLarge: TextStyle(
      fontSize: 36.sp,
      // fontSize: 20.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 14.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    //! LABEL
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 12.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      color: AppColors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),

    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );
}
