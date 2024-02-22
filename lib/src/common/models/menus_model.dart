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
      icon: AppIcons.chatIcon,
      text: "Chat",
    ),
    MenusModels(
      icon: AppIcons.chatIcon,
      text: "New chat",
    ),
    MenusModels(
      icon: AppIcons.chatIcon,
      text: "History",
    ),
    MenusModels(
      icon: AppIcons.developersIcon,
      text: "Developers",
    ),
    MenusModels(
      icon: AppIcons.about,
      text: "About",
    ),
  ];
}
