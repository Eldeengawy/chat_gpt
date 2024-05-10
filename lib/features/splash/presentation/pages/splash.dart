import 'package:chat_gpt/config/routes/routes.dart';
import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:shirta/features/all/auth/data/models/user.dart';
// import 'package:shirta/features/all/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
// import 'package:shirta/features/all/auth/presentation/cubit/user_cubit/user_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        context.pushReplacement(Routes.onBoarding);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Hero(
              tag: 'logo',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.logo),
                  40.ph,
                  Text(
                    'ChatGPT',
                    style: AppStyles.bold40white,
                  ),
                ],
              )
              // SvgPicture.asset(
              //   AppIcons.logo,
              // ),
              ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
