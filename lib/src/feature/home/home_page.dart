import 'dart:math';

import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:ai_project/src/feature/home/bloc/chat_bloc.dart';
import 'package:ai_project/src/feature/home/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../about/about.dart';
import '../developers/developers.dart';
import '../history/history_page.dart';
import '../main_page/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> index = ValueNotifier<int>(0);
  ValueNotifier<double> radius = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          MainPage(
            valueNotifier: index,
            radius: radius,
          ),
          ValueListenableBuilder(
            valueListenable: radius,
            builder: (context, item, child) {
              return TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0,
                  end: item,
                ),
                duration: const Duration(milliseconds: 500),
                builder: (_, double val, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, size.width * 0.55 * val)
                      ..rotateY((pi / 6) * val),
                    child: child,
                  );
                },
                child: ValueListenableBuilder(
                  valueListenable: index,
                  builder: (context, value, child) {
                    return IndexedStack(
                      index: value,
                      children: [
                        Home(radius: radius),
                        const Scaffold(),
                        HistoryPage(
                          radius: item == 1 ? 20 : 0,
                        ),
                        Developers(
                          radius: item == 1 ? 20 : 0,
                        ),
                        const About(),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              FocusScope.of(context).unfocus();
              if (e.delta.dx <= 0) {
                radius.value = 0;
              }
            },
          ),
        ],
      ),
    );
  }
}
