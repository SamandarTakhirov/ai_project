import 'dart:typed_data';

import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';

class ChatPage extends StatefulWidget {
  final List<Content> contents;
  final ScrollController controller;

  const ChatPage({
    super.key,
    required this.contents,
    required this.controller,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ScreenshotController screenshotController;

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now().millisecondsSinceEpoch;

    final result = await ImageGallerySaver.saveImage(
      bytes,
      name: "FloraAI_$time",
    );

    return result["filePath"];
  }

  @override
  void initState() {
    screenshotController = ScreenshotController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ListView.builder(
      controller: widget.controller,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final content = widget.contents.elementAt(index);
        final isUser = content.role == "user";
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: !isUser ? AppColors.aiTextBKG : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomRight: Radius.circular(
                  isUser ? 0 : 20,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(!isUser ? 8.0 : 0),
              child: Column(
                crossAxisAlignment:
                    !isUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  !isUser
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: const AssetImage(AppIcons.flora),
                                  width: size.width * 0.07,
                                  height: size.width * 0.07,
                                ),
                                Text(
                                  "Answer",
                                  style: context.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            _CustomButton(
                              onTap: () async {
                                final image = await screenshotController
                                    .captureFromWidget(
                                  context: context,
                                  Screenshot(
                                    controller: screenshotController,
                                    child: const Column(
                                      children: [
                                        Text("quistions"),
                                        Text("\n\nanswer"),
                                      ],
                                    ),
                                  ),
                                );
                                final path = await saveImage(image);

                                await Share.shareXFiles(
                                  [XFile(path)],
                                  text: "hello",
                                );
                              },
                              icon: AppIcons.share,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color:
                          isUser ? AppColors.userTextBKG : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                        bottomLeft: Radius.circular(
                          !isUser ? 0 : 20,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(isUser ? 10.0 : 0),
                      child: Text(
                        "${widget.contents[index].parts?.map((e) => e.text).join()}",
                        textAlign: isUser ? TextAlign.right : TextAlign.left,
                        style: context.textTheme.titleSmall?.copyWith(
                          color: isUser ? AppColors.white : AppColors.black,
                          fontWeight:
                              isUser ? FontWeight.w500 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: widget.contents.length,
    );
  }
}

class _CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String icon;

  const _CustomButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: FilledButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(0),
      ),
      padding: const EdgeInsets.all(0),
      onPressed: onTap,
      icon: SizedBox(
        width: 18,
        height: 18,
        child: Lottie.asset(
          icon,
          filterQuality: FilterQuality.high,
          frameRate: FrameRate.max,
        ),
      ),
    );
  }
}
