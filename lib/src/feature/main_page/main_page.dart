import 'package:ai_project/src/common/models/menus_model.dart';
import 'package:ai_project/src/common/utils/context_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';

class MainPage extends StatelessWidget {
  final ValueNotifier<int> valueNotifier;
  final ValueNotifier<double> radius;

  const MainPage({
    required this.valueNotifier,
    required this.radius,
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
    final user = FirebaseAuth.instance.currentUser;
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
                        image: NetworkImage("${user!.photoURL}"),
                      ),
                    ),
                    title: Text(
                      "${user.displayName}".replaceRange(
                        "${user.displayName}".indexOf(" "),
                        "${user.displayName}".length,
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
                      "${user.email}",
                      style: context.textTheme.labelSmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      const item = MenusModels.menus;
                      return _CustomListTile(
                        menusModels: item[index],
                        onTap: () {
                          valueNotifier.value = index;
                          radius.value = 0;
                        },
                      );
                    },
                    itemCount: MenusModels.menus.length,
                  ),
                ],
              ),
              Column(
                children: [
                  _CustomListTile(
                    onTap: () {
                      radius.value = 0;
                    },
                    menusModels: const MenusModels(
                      icon: AppIcons.logout,
                      text: "Log out",
                    ),
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

class _CustomListTile extends StatelessWidget {
  final MenusModels menusModels;
  final void Function() onTap;

  const _CustomListTile({
    required this.menusModels,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        menusModels.icon,
        color: AppColors.white,
        width: 20,
        height: 20,
      ),
      title: Text(
        menusModels.text,
        style: context.textTheme.titleMedium?.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
