import 'package:ai_project/src/common/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants/app_colors.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Lottie.asset(
              "assets/lottie/ai_logo.json",
            ),
          ),
          SizedBox(
            height: size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome to\nFloraAI",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _button(
                        size: size,
                        image: AppImages.google,
                        text: "Login with Google",
                      ),
                      _button(
                        size: size,
                        image: AppImages.apple,
                        text: "Login with Apple ID",
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _button(
    {required Size size, required String text, required String image}) {
  return FilledButton(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.buttonBKG,
      fixedSize: Size(size.width * 0.85, size.height * 0.065),
    ),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size.width * 0.07,
          height: size.width * 0.07,
          child: Image(
            image: AssetImage(image),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  );
}
