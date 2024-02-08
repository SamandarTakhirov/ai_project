// ignore_for_file: deprecated_member_use

import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:ai_project/src/feature/home/bloc/chat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:ai_project/src/common/constants/app_icons.dart';
import 'package:ai_project/src/common/constants/app_images.dart';

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
              icon: const Icon(
                Icons.more_horiz,
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
                    return const Center(
                      child: Text("Suhbatni boshlash uchun yozing"),
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
                    Visibility(
                      visible: false,
                      child: _customButton(
                        icon: AppIcons.rest,
                        context: context,
                        text: "Regenerate Response",
                        size: size,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ColoredBox(
                      color: AppColors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: ValueListenableBuilder(
                            valueListenable: widget.radius,
                            builder: (context, radiusValue, child) {
                              return TextField(
                                controller: textEditingController,
                                enabled: radiusValue > 0 ? false : true,
                                maxLines: 1,
                                cursorColor: AppColors.black,
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      onPressed: () async {
                                        if (textEditingController
                                            .text.isNotEmpty) {
                                          notifier
                                              .add(textEditingController.text);
                                          _gemini
                                              .streamChat(notifier.value)
                                              .listen((event) {
                                            notifier
                                                .addFromModel(event.content);
                                          });
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
                            }),
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
}) =>
    OutlinedButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        fixedSize: Size(
          size.width * 0.6,
          size.height * 0.05,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            color: AppColors.text6161,
          ),
          Text(
            text,
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.text6161,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
