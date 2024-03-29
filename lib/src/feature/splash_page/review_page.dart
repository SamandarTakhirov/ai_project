import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../auth/login_page.dart';
import 'widgets/carousel_widgets.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late final CarouselController _controller;
  final ValueNotifier<int> activeIndex = ValueNotifier(0);

  Map<String, String> images = {
    AppImages.splashOne: "Unlock the Power Of Future AI",
    AppImages.splashTwo: "Chat With Your Favourite Ai",
    AppImages.splashThree: "Boost Your Mind Power with Ai",
  };

  @override
  void initState() {
    _controller = CarouselController();
    super.initState();
  }

  void openLoginPage() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: openLoginPage,
            style: FilledButton.styleFrom(
              surfaceTintColor: Colors.transparent,
            ),
            child: Text(
              "Skip",
              style: TextStyle(
                color: AppColors.textGrey,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.75,
                          child: Image.asset(
                            images.keys.elementAt(index),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              Text(
                                images.values.elementAt(index),
                                textAlign: TextAlign.center,
                                style:
                                    context.textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Chat with the smartest AI Future Experience power of AI with us",
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    viewportFraction: 1,
                    height: size.height * 0.8,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnManualNavigate: true,
                    onPageChanged: (index, reason) => activeIndex.value = index,
                  ),
                ),
                Positioned(
                  width: size.width,
                  height: size.height * 1.02,
                  child: Center(
                    child: ValueListenableBuilder(
                      valueListenable: activeIndex,
                      builder: (context, index, _) {
                        return BuildIndicator(
                          count: 3,
                          activeIndex: index,
                          colors: Colors.black,
                          // count: 5,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.4,
              height: size.height * 0.08,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x800f0f0f),
                      blurRadius: 30,
                      spreadRadius: 5,
                      offset: Offset(0, 20),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () => _controller.previousPage(),
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 2,
                      child: ColoredBox(
                        color: AppColors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _controller.nextPage(),
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
