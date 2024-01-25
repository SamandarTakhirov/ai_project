import 'package:ai_project/src/common/constants/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants/app_colors.dart';
import '../home/home_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  Future<UserCredential> singInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> userSingOut() async {
    await GoogleSignIn().signOut();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          Center(
            child: Lottie.asset(
              "assets/lottie/ai_logo.json",
              controller: controller,
              filterQuality: FilterQuality.high,
              frameRate: FrameRate.max,
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
                        onTap: () async {
                          final userCredential = await singInWithGoogle();
                          if (userCredential.user!.emailVerified) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        },
                        size: size,
                        image: AppImages.google,
                        text: "Login with Google",
                      ),
                      _button(
                        onTap: () {},
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

Widget _button({
  required Size size,
  required String text,
  required String image,
  required void Function() onTap,
}) {
  return FilledButton(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.buttonBKG,
      fixedSize: Size(size.width * 0.85, size.height * 0.065),
    ),
    onPressed: onTap,
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
