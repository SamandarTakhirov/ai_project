import 'package:flutter/material.dart';

import 'home.dart';

class ChatPage extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final MyNotifier notifier;

  const ChatPage({
    required this.snapshot,
    required this.notifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasError) {
      return Center(
        child: Text(snapshot.error.toString()),
      );
    }

    final candidates = snapshot.data!;
    notifier.addParts(candidates);
    String a = notifier.value.map((e) {
      "${e.parts?.map((e) => e.text).join()}\n\n";
    }).join();

    List<String> b = List.generate(
        a.split("\n\n").length, (index) => a.split("\n\n").join());
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(b[index]);
      },
      itemCount: b.length,
    );
  }
}
