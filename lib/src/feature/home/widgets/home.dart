// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:ai_project/src/common/utils/context_utils.dart';

import 'package:flutter_gemini/src/models/candidates/candidates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:ai_project/src/common/constants/app_icons.dart';
import 'package:ai_project/src/common/constants/app_images.dart';

class Home extends StatefulWidget {
  final double radius;

  const Home({
    required this.radius,
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController textEditingController;
  static final _gemini = Gemini.instance;
  final MyNotifier notifier = MyNotifier(
    [
      Content(
        parts: [
          Parts(
            text: "Basic data of Flutter",
          ),
        ],
        role: "user",
      ),
    ],
  );

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(widget.radius),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AppIcons.flora,
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
        body: Stack(
          children: [
            Positioned.fill(
              child: ValueListenableBuilder(
                valueListenable: notifier,
                builder: (context, contents, value) {
                  print("${contents.length}----------------------LEngth");
                  return StreamBuilder(
                    stream: _gemini.streamChat(contents),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final candidates = snapshot.data!;
                      notifier.addParts(candidates);
                      return SingleChildScrollView(
                        child: Text(notifier.value.map((e) {
                          return "${e.parts?.map((e) => e.text).join()}\n\n";
                        }).join()),
                      );
                    },
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: 1,
              right: 1,
              child: Builder(builder: (context) {
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                      ),
                      child: TextField(
                        controller: textEditingController,
                        enabled: widget.radius > 0 ? false : true,
                        maxLines: 1,
                        cursorColor: AppColors.black,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () async {
                                if (textEditingController.text.isNotEmpty) {
                                  final Content userContent = Content(
                                    parts: [
                                      Parts(
                                        text: textEditingController.text,
                                      )
                                    ],
                                    role: "user",
                                  );
                                  notifier.add(userContent);
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
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
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

class MyNotifier extends ValueNotifier<List<Content>> {
  MyNotifier(super.value);

  void add(Content newContent) {
    value.add(newContent);
    notifyListeners();
  }

  void addParts(Candidates candidate) {
    if (value.last.role == "user") {
      value.add(candidate.content!);
    } else {
      value.last.parts?.add(candidate.content!.parts!.single);
    }
  }

  void setWithoutNotify(List<Content> contents) => value = contents.toList();

  @override
  set value(List<Content> newValue) {
    value = newValue.toList();
    notifyListeners();
  }
}
