import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';

class About extends StatelessWidget {
  final ValueNotifier<double> radius;

  const About({
    required this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: radius,
      builder: (context, radiusValue, child) {
        return ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(radiusValue == 1 ? 20 : 0),
          ),
          child: child,
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,
          leading: GestureDetector(
            onTap: () {
              radius.value = 1;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppIcons.flora,
              ),
            ),
          ),
          title: Text(
            "About",
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Lottie.asset(
                AppIcons.more,
                filterQuality: FilterQuality.high,
                frameRate: FrameRate.max,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
