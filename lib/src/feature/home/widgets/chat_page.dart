import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gemini/src/models/candidates/candidates.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import 'home.dart';

class ChatPage extends StatelessWidget {
  final AsyncSnapshot<Candidates> snapshot;
  final MyNotifier notifier;

  const ChatPage({
    required this.snapshot,
    required this.notifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (snapshot.hasError) {
      return Center(
        child: Text(snapshot.error.toString()),
      );
    }

    if (snapshot.hasData &&
        snapshot.connectionState != ConnectionState.waiting) {
      notifier.addParts(snapshot.data!);
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            index == notifier.value.length) {
          return const CupertinoActivityIndicator();
        }
        final content = notifier.value[index];
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
                    index.isEven ? AppColors.aiTextBKG : AppColors.userTextBKG,
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
                      textAlign:
                          index.isEven ? TextAlign.right : TextAlign.left,
                      "${content.parts?.map((e) => e.text).join()}",
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
      itemCount: notifier.value.length +
          (snapshot.connectionState == ConnectionState.waiting ? 1 : 0),
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
        padding: EdgeInsets.all(0),
      ),
      padding: EdgeInsets.all(0),
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 18,
      ),
    );
  }
}
