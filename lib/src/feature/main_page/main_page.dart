import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../home/widgets/home.dart';

class MainPage extends StatelessWidget {
  final UserCredential userCredential;

  const MainPage({
    required this.userCredential,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    List<String> icons = [
      AppIcons.instagram,
      AppIcons.telegram,
      AppIcons.appstore,
      AppIcons.googlePlay,
    ];
    return Scaffold(
      body: ColoredBox(
        color: AppColors.black,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      child: Image(
                        image: NetworkImage("${userCredential.user!.photoURL}"),
                      ),
                    ),
                    title: Text(
                      "${userCredential.user!.displayName}".replaceRange(
                        "${userCredential.user!.displayName}".indexOf(" "),
                        "${userCredential.user!.displayName}".length,
                        "",
                      ),
                      maxLines: 1,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      maxLines: 1,
                      "${userCredential.user!.email}",
                      style: context.textTheme.labelSmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _customListTile(
                    onTap: () {},
                    context: context,
                    title: "Chat",
                    icon: AppIcons.chat,
                  ),
                  _customListTile(
                    context: context,
                    title: "New chat",
                    icon: AppIcons.newWindow,
                  ),
                  _customListTile(
                    context: context,
                    title: "History",
                    icon: AppIcons.history,
                  ),
                  _customListTile(
                    context: context,
                    title: "Developers",
                    icon: AppIcons.developer,
                  ),
                  _customListTile(
                    context: context,
                    title: "About",
                    icon: AppIcons.info,
                  ),
                ],
              ),
              Column(
                children: [
                  _customListTile(
                    context: context,
                    title: "Log out",
                    icon: AppIcons.logout,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                      ),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => _customDecoratedBox(
                          icon: icons[index],
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemCount: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _customDecoratedBox({
  required String icon,
}) =>
    DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        border: Border.all(
          color: AppColors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          icon,
          width: 24,
          color: AppColors.white,
        ),
      ),
    );

Widget _customListTile({
  required BuildContext context,
  required String title,
  required String icon,
  void Function()? onTap,
}) =>
    ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        icon,
        color: AppColors.white,
        width: 20,
        height: 20,
      ),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
