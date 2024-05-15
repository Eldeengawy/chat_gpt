// import 'package:chat_gpt/core/theme/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class ThemeManager {
//   static const String _boxName = 'themeBox';

//   static Future<void> init() async {
//     await Hive.openBox(_boxName);
//   }

//   static void toggleTheme(bool isDarkMode, Color scaffoldBackgroundColor,
//       Color backgroundColor, Color textColor) {
//     final themeBox = Hive.box(_boxName);
//     themeBox.put('theme', {
//       'isDarkMode': isDarkMode,
//       'scaffoldBackgroundColor': scaffoldBackgroundColor.value,
//       'backgroundColor': backgroundColor.value,
//       'textColor': textColor.value,
//     });
//   }

//   static ThemeData getTheme() {
//     final themeBox = Hive.box(_boxName);
//     final themeData = themeBox.get('theme', defaultValue: {
//       'isDarkMode': false,
//       'scaffoldBackgroundColor': AppColors.grey34.value,
//       'backgroundColor': AppColors.black20.value,
//       'textColors': AppColors.white.value,
//     });
//     final bool isDarkMode = themeData['isDarkMode'];
//     final Color scaffoldBackgroundColor =
//         Color(themeData['scaffoldBackgroundColor']);
//     // final Color backgroundColor = Color(themeData['backgroundColor']);
//     // final Color textColor = Color(themeData['textColor']);

//     return ThemeData(
//       brightness: isDarkMode ? Brightness.dark : Brightness.light,
//       scaffoldBackgroundColor: scaffoldBackgroundColor,

//       appBarTheme: const AppBarTheme(
//         color: Colors.transparent,
//       ),

//       // colorScheme: const ColorScheme.dark(
//       //   primary: AppColors.primary,
//       // ),
//       // Add more theme attributes as needed
//     );
//   }

//   // static Widget toggleSwitch() {
//   //   final themeBox = Hive.box(_boxName);
//   //   final themeData = themeBox.get('theme', defaultValue: {
//   //     'isDarkMode': false,
//   //     'scaffoldBackgroundColor': Colors.blue.value
//   //   });
//   //   bool isDarkMode = themeData['isDarkMode'];
//   //   Color scaffoldBackgroundColor = Color(themeData['scaffoldBackgroundColor']);

//   //   return Switch(
//   //     value: isDarkMode,
//   //     onChanged: (value) {
//   //       isDarkMode = value;
//   //       toggleTheme(isDarkMode, scaffoldBackgroundColor);
//   //     },
//   //   );
//   // }
// }
