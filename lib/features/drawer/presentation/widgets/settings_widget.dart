import 'package:chat_gpt/config/routes/routes.dart';
import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/core/theme/theme_cubit/theme_cubit.dart';
import 'package:chat_gpt/core/theme/theme_cubit/theme_state.dart';
import 'package:chat_gpt/features/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: isDarkMode(context)
                  ? AppColors.white.withOpacity(0.4)
                  : AppColors.black.withOpacity(0.4)),
        ),
      ),
      child: Column(
        children: [
          SettingsItem(
            color: isDarkMode(context) ? AppColors.white : AppColors.black,
            title: 'Clear conversations',
            icon: AppIcons.trash,
            onTap: () {
              DrawerCubit.get(context).deleteAllChats();
            },
          ),
          SettingsItem(
            color: isDarkMode(context) ? AppColors.white : AppColors.black,
            title: 'Upgrade to plus',
            icon: AppIcons.person,
            isNew: true,
            onTap: () {
              context.push(Routes.upgradeToPlus);
            },
          ),
          SettingsItem(
            color: isDarkMode(context) ? AppColors.white : AppColors.black,
            title: 'Light mode',
            icon: AppIcons.lightMode,
            suffixWidget: BlocBuilder<ThemeCubit, ThemeStates>(
              builder: (BuildContext context, ThemeStates state) => Switch(
                activeTrackColor: AppColors.primary,
                activeColor: AppColors.white,
                value: ThemeCubit.get(context).isLight,
                onChanged: (value) {
                  ThemeCubit.get(context).changeTheme();
                  // ThemeManager.toggleTheme(
                  //     value,
                  //     value ? AppColors.grey34 : AppColors.white,
                  //     AppColors.black,
                  //     AppColors.white);
                },
              ),
            ),
          ),
          SettingsItem(
            color: isDarkMode(context) ? AppColors.white : AppColors.black,
            title: 'Updates & FAQ',
            icon: AppIcons.updates,
            onTap: () {
              context.push(Routes.faqScreen);
            },
          ),
          SettingsItem(
            title: 'Logout',
            icon: AppIcons.logout,
            color: AppColors.redED,
            onTap: () async {
              await DrawerCubit.get(context).deleteAllChats();
              context.pushReplacement(Routes.onBoarding);
            },
          ),
        ],
      ),
    );
  }
}
