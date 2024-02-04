import 'package:flutter/material.dart';

class Developers extends StatelessWidget {
  final double radius;

  const Developers({
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
