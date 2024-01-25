import 'package:ai_project/src/common/constants/app_icons.dart';

class MenusModels {
  final String text;
  final String icon;

  const MenusModels({
    required this.text,
    required this.icon,
  });

  static const List<MenusModels> menus =  [
    MenusModels(
      icon: AppIcons.chat,
      text: "Chat",
    ),
    MenusModels(
      icon: AppIcons.newWindow,
      text: "New chat",
    ),
    MenusModels(
      icon: AppIcons.history,
      text: "History",
    ),
    MenusModels(
      icon: AppIcons.developer,
      text: "Developers",
    ),
    MenusModels(
      icon: AppIcons.info,
      text: "About",
    ),
  ];
}
