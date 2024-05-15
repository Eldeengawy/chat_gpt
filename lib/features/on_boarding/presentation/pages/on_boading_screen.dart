import 'package:chat_gpt/config/routes/routes.dart';
import 'package:chat_gpt/core/extensions/sized_box.dart';
import 'package:chat_gpt/core/functions/is_dark.dart';
import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/static/icons.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:chat_gpt/features/on_boarding/presentation/widgets/capabilities_widget.dart';
import 'package:chat_gpt/features/on_boarding/presentation/widgets/examples_widget.dart';
import 'package:chat_gpt/features/on_boarding/presentation/widgets/indicator_widget.dart';
import 'package:chat_gpt/features/on_boarding/presentation/widgets/limitations_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int pageIndex = 0;
  final List<Widget> _pages = [
    const ExamplesWidget(),
    const CapabilitiesWidget(),
    const LimitationsWidget(),
  ];
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.ph,
              Hero(
                tag: 'logo',
                child: SvgPicture.asset(
                  AppIcons.logo,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      isDarkMode(context) ? AppColors.white : AppColors.black,
                      BlendMode.srcIn),
                ),
              ),
              24.ph,
              Text(
                'Welcome to\nChatGPT',
                style: AppStyles.bold32white.copyWith(
                    color: isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black),
                textAlign: TextAlign.center,
              ),
              24.ph,
              Text(
                'Ask anything, get your answer',
                style: AppStyles.semiBold15white.copyWith(
                    fontSize: 16.r,
                    color: isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black),
                textAlign: TextAlign.center,
              ),
              60.ph,
              Expanded(
                child: PageView(
                  controller: controller,
                  children: _pages,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                ),
              ),
              60.ph,
              Indicators(page: pageIndex),
              20.ph,
              CustomElevatedButton(
                  title: pageIndex == 2 ? 'Let\'s Chat' : 'Next',
                  icon: pageIndex == 2 ? AppIcons.arrowRight : null,
                  onPressed: () {
                    if (pageIndex == 2) {
                      context.pushReplacement(Routes.drawer);
                    }
                    pageIndex++;
                    controller.animateToPage(pageIndex,
                        duration: Durations.medium1,
                        curve: Curves.easeInOutCubic);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
