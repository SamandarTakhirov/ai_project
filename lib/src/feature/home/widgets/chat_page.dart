import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';

class ChatPage extends StatelessWidget {
  final List<Content> contents;
  final ScrollController controller;

  const ChatPage({
    super.key,
    required this.contents,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.2,
            minWidth: size.width * 0.2,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color:
                    index.isOdd ? AppColors.aiTextBKG : AppColors.userTextBKG,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(
                    index.isEven ? 20 : 0,
                  ),
                  bottomRight: Radius.circular(
                    index.isEven ? 0 : 20,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: index.isOdd
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    index.isOdd
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
                                    style:
                                        context.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _CustomButton(
                                    onTap: () {},
                                    icon: Icons.copy,
                                  ),
                                  _CustomButton(
                                    onTap: () {},
                                    icon: Icons.share,
                                  ),
                                ],
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                    Text(
                      "${contents[index].parts?.map((e) => e.text).join()}",
                      textAlign:
                          index.isEven ? TextAlign.right : TextAlign.left,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: index.isEven ? AppColors.white : AppColors.black,
                        fontWeight:
                            index.isEven ? FontWeight.w500 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: contents.length,
    );
  }
}

class _CustomButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;

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
      icon: Icon(
        icon,
        size: 18,
      ),
    );
  }
}
