import 'dart:math';

import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:ai_project/src/feature/home/widgets/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_page/main_page.dart';

class HomePage extends StatefulWidget {
  final UserCredential userCredential;

  const HomePage({
    required this.userCredential,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          MainPage(
            userCredential: widget.userCredential,
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0,
              end: value,
            ),
            duration: const Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, size.width * 0.55 * val)
                  ..rotateY((pi / 6) * val),
                child:  Home(
                  radius: value == 1 ? 20 : 0,
                ),
              ));
            },
          ),
          GestureDetector(
            // onTap: () {
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // },
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
