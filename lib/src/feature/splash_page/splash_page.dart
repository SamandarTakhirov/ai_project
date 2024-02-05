import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:ai_project/src/feature/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  final ValueNotifier<String> version = ValueNotifier("1.0.0");

  Future<void> checkVersion() async {
    final package = await PackageInfo.fromPlatform();
    version.value = package.version;
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    checkVersion();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Lottie.asset(
              "assets/lottie/ai_logo.json",
              controller: controller,
              filterQuality: FilterQuality.high,
              frameRate: FrameRate.max,
            ),
          ),
          Column(
            children: [
              Text(
                "FloraAI",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: version,
                builder: (context, ver, child) {
                  return Text(
                    "Version $ver",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
