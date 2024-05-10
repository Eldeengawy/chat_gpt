import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Indicators extends StatelessWidget {
  const Indicators({
    super.key,
    required int page,
  }) : pageIndex = page;

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IndicatorWidget(
          indicatorIndex: 0,
          pageIndex: pageIndex,
        ),
        IndicatorWidget(
          indicatorIndex: 1,
          pageIndex: pageIndex,
        ),
        IndicatorWidget(
          indicatorIndex: 2,
          pageIndex: pageIndex,
        ),
      ],
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  final int indicatorIndex;
  final int pageIndex;
  const IndicatorWidget({
    super.key,
    required this.indicatorIndex,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 28,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: indicatorIndex == pageIndex
            ? AppColors.primary
            : AppColors.white.withOpacity(0.2),
      ),
    );
  }
}
