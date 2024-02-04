import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final double radius;

  const HistoryPage({
    required this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Scaffold(),
    );
  }
}
