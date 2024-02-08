import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

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
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              contents.elementAt(index).parts?.map((e) => e.text).join() ?? ""),
        );
      },
      itemCount: contents.length,
    );
  }
}
