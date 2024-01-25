import 'package:ai_project/src/common/constants/app_colors.dart';
import 'package:ai_project/src/common/constants/app_icons.dart';
import 'package:ai_project/src/common/constants/app_images.dart';
import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  final double radius;

  const Home({
    required this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
      child: Scaffold(
        appBar: AppBar(
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
            Positioned(
              bottom: 10,
              left: 1,
              right: 1,
              child: Column(
                children: [
                  _customButton(
                    icon: AppIcons.rest,
                    context: context,
                    text: "Regenerate Response",
                    size: size,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: TextField(
                      maxLines: 1,
                      cursorColor: AppColors.black,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {},
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
