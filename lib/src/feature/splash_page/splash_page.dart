import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'review_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ValueNotifier<String> appVersion = ValueNotifier("");
  @override
  void initState() {
    super.initState();
    getVersion().then((value) => openReviewPage());
  }

  void openReviewPage() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ReviewPage(),
          ),
        );
      },
    );
  }

  Future<void> getVersion() async {
    appVersion.value = (await PackageInfo.fromPlatform()).version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Lottie.asset("assets/lottie/ai_logo.json"),
          ),
          Column(
            children: [
              Text(
                "GoogleAI",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: appVersion,
                builder: (context, version, child) {
                  return Text(
                    "Version $version",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  );
                }
              ),
            ],
          )
        ],
      ),
    );
  }
}
