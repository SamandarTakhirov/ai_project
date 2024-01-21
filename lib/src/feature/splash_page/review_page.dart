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
  int activeIndex = 0;

  Map<String, String> images = {
    AppImages.splashOne: "Unlock the Power Of Future AI",
    AppImages.splashTwo: "Chat With Your Favourite Ai",
    AppImages.splashThree: "Boost Your Mind Power with Ai",
  };

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
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.8,
                          child: Image.asset(
                            images.keys.elementAt(index),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              Text(
                                images.values.elementAt(index),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                "Chat with the smartest AI Future Experience power of AI with us",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.textGrey,
                                  fontSize: 16,
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
                    onPageChanged: (index, reason) => setState(
                      () => activeIndex = index,
                    ),
                  ),
                ),
                Positioned(
                  width: size.width,
                  height: size.height * 1.05,
                  child: Center(
                    child: BuildIndicator(
                      count: 3,
                      activeIndex: activeIndex,
                      colors: Colors.black,
                      // count: 5,
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.grey,
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
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_rounded),
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
