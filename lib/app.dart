import 'package:chat_gpt/config/routes/app_router.dart';
import 'package:chat_gpt/core/static/strings.dart';
import 'package:chat_gpt/core/theme/dark_theme.dart';
import 'package:chat_gpt/core/theme/light_theme.dart';
import 'package:chat_gpt/core/theme/theme_cubit/theme_cubit.dart';
import 'package:chat_gpt/core/theme/theme_cubit/theme_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatGPT extends StatelessWidget {
  ChatGPT({super.key});
  final AppRouter appRouter = AppRouter(); // Create an instance of AppRouter

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ThemeCubit()),
            ],
            child: BlocBuilder<ThemeCubit, ThemeStates>(
              builder: (BuildContext context, ThemeStates state) =>
                  MaterialApp.router(
                // useInheritedMediaQuery: true,
                // locale: DevicePreview.locale(context),
                // builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                localizationsDelegates: context.localizationDelegates,
                title: Strings.appName,
                // builder: (context, child) {
                //   return MediaQuery(
                //     data: MediaQuery.of(context)
                //         .copyWith(textScaler: const TextScaler.linear(0.8)),
                //     child: child!,
                //   );
                // },
                theme: ThemeCubit.get(context).isLight
                    ? lightTheme(context)
                    : darkTheme(context),
                // darkTheme: darkTheme(context),
                // theme: lightTheme(context),
                // darkTheme: darkTheme(context),
                // theme: ThemeManager.getTheme(),
                // routerConfig: appRouter.router,
                routeInformationParser: appRouter.router.routeInformationParser,
                routeInformationProvider:
                    appRouter.router.routeInformationProvider,
                routerDelegate: appRouter.router.routerDelegate,
                backButtonDispatcher: RootBackButtonDispatcher(),

                // home: const SplashScreen(),
              ),
            ),
          );
        });
  }
}
