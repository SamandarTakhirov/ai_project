import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/constants/app_colors.dart';

class BuildIndicator extends StatelessWidget {
  final int activeIndex;
  final Color colors;
  final int count;

  const BuildIndicator({
    required this.count,
    required this.activeIndex,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: ScrollingDotsEffect(
        activeStrokeWidth: 2.6,
        activeDotScale: 1.3,
        maxVisibleDots: 5,
        radius: 8,
        activeDotColor: AppColors.black,
        spacing: 10,
        dotHeight: 12,
        dotWidth: 12,
      ),
    );
  }
}
