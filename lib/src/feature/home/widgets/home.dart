// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:ai_project/src/common/utils/context_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:ai_project/src/common/constants/app_icons.dart';
import 'package:ai_project/src/common/constants/app_images.dart';
import 'package:lottie/lottie.dart';

import 'chat_page.dart';

class Home extends StatefulWidget {
  const Home({
    required this.radius,
    super.key,
  });

  final ValueNotifier<double> radius;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController textEditingController;
  final MyNotifier notifier = MyNotifier([]);
  late final ScrollController _scrollController;
  static final _gemini = Gemini.instance;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final ValueNotifier<bool> isRunning = ValueNotifier(false);
  StreamSubscription? streamSubscription;

  List<String> questions = [
    "FloraAI haqida to'liq ma'lumot",
    "Dasturchilar haqida ma'lumot",
    "O'zbekiston 2024",
    "What is Flora",
    "What weather today",
    "Who is best Uzbek or English",
  ];

  @override
  void initState() {
    textEditingController = TextEditingController();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.clear();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ValueListenableBuilder(
      valueListenable: widget.radius,
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
              widget.radius.value = 1;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppIcons.flora,
              ),
            ),
          ),
          title: Text(
            "FloraAI",
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
        body: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: notifier,
                builder: (context, value, child) {
                  if (value.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Savollaringizni yozishingiz yoki tezkor savollardan foydalanishingiz mumkin",
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: size.width * 0.02,
                              mainAxisExtent: size.height * 0.1,
                              mainAxisSpacing: size.width * 0.02,
                              childAspectRatio: 20,
                            ),
                            itemCount: questions.length,
                            itemBuilder: (context, index) {
                              return _CustomTextButton(
                                onTap: () async {
                                  notifier.add(questions[index]);
                                  _gemini
                                      .streamChat(notifier.value)
                                      .listen((event) {
                                    notifier.addFromModel(event.content);
                                  });
                                },
                                size: size,
                                text: questions[index],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  );
                  return ChatPage(
                    contents: value,
                    controller: _scrollController,
                  );
                },
              ),
            ),
            Builder(
              builder: (context) {
                final size = MediaQuery.sizeOf(context);
                return Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isRunning,
                      builder: (context, running, _) {
                        return Visibility(
                          visible: running,
                          child: _customButton(
                            icon: running
                                ? AppIcons.stopLottie
                                : AppIcons.restart,
                            context: context,
                            text: running ? "Stop" : "Regenerate Response",
                            size: running
                                ? Size(
                                    size.width * 0.22,
                                    size.height * 0.05,
                                  )
                                : Size(
                                    size.width * 0.5,
                                    size.height * 0.05,
                                  ),
                            onPressed: running
                                ? () {
                                    streamSubscription?.cancel();
                                    isRunning.value = false;
                                  }
                                : () {},
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    ColoredBox(
                      color: AppColors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          right: size.width * 0.05,
                          bottom: 10,
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: widget.radius,
                          builder: (context, radiusValue, child) {
                            return ValueListenableBuilder(
                              valueListenable: isRunning,
                              builder: (context, running, _) {
                                return TextField(
                                  controller: textEditingController,
                                  enabled: (radiusValue > 0 ? false : true) &&
                                      !running,
                                  maxLines: 1,
                                  cursorColor: AppColors.black,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                        onPressed: () async {
                                          if (textEditingController
                                              .text.isNotEmpty) {
                                            isRunning.value = true;
                                            notifier.add(
                                                textEditingController.text);
                                            streamSubscription = _gemini
                                                .streamChat(notifier.value)
                                                .listen(
                                              (event) {
                                                notifier.addFromModel(
                                                  event.content,
                                                );
                                              },
                                              onDone: () {
                                                isRunning.value = false;
                                              },
                                              onError: (e) {
                                                print("Error: $e");
                                              },
                                              cancelOnError: true,
                                            );

                                            textEditingController.clear();
                                          }
                                        },
                                        icon: Image(
                                          width: 35,
                                          color: AppColors.black,
                                          image: AssetImage(AppImages.send),
                                        ),
                                      ),
                                    ),
                                    hintText: "Send a message.",
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextButton extends StatelessWidget {
  final Size size;
  final String text;
  final void Function() onTap;

  const _CustomTextButton({
    required this.size,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.aiTextBKG,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyNotifier extends ValueNotifier<List<Content>> {
  MyNotifier(super.value);

  void add(String text) {
    final content = Content(
      parts: [
        Parts(text: text),
      ],
      role: "user",
    );
    value.add(content);
    notifyListeners();
  }

  void addFromModel(Content? content) {
    if (content == null || content.parts == null) return;

    if (value.last.role == "model") {
      value.last.parts?.addAll(content.parts ?? []);
    } else {
      value.add(content);
    }
    notifyListeners();
  }
}

Widget _customButton({
  required BuildContext context,
  required Size size,
  required String text,
  required String icon,
  required VoidCallback onPressed,
}) =>
    OutlinedButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
          fixedSize: size, padding: const EdgeInsets.all(0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Lottie.asset(
            icon,
            // controller: controller,
            filterQuality: FilterQuality.high,
            frameRate: FrameRate.max,
          ),
          Expanded(
            child: Text(
              text,
              style: context.textTheme.labelMedium?.copyWith(
                color: AppColors.text6161,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
