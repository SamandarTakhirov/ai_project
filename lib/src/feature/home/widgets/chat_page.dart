import 'package:flutter/cupertino.dart';

import 'package:flutter_gemini/src/models/candidates/candidates.dart';

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
        return Text("${content.parts?.map((e) => e.text).join()}\n\n");
      },
      itemCount: notifier.value.length +
          (snapshot.connectionState == ConnectionState.waiting ? 1 : 0),
    );
  }
}
