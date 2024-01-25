import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:ai_project/src/common/constants/app_icons.dart';
import 'package:ai_project/src/common/constants/app_images.dart';
import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:ai_project/src/feature/home/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  late final ChatBloc chatBloc;
  final List<Content> contents = [];

  @override
  void initState() {
    chatBloc = ChatBloc();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    chatBloc.close();
    textEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider.value(
      value: chatBloc,
      child: ClipRRect(
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
          body: BlocListener<ChatBloc, ChatState>(
            listener: (context, state) {
              print(state.contents);
            },
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  left: 1,
                  right: 1,
                  child: Column(
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
                                onPressed: () {
                                  if (textEditingController.text.isNotEmpty) {

                                    chatBloc.add(
                                      ChatEvent.send(
                                        text: textEditingController.text.trim(),
                                      ),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
