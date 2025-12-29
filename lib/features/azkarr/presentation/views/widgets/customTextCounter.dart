import 'package:flutter/material.dart';

class counterText extends StatelessWidget {
  const counterText({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      " $count",
      style: TextStyle(
        fontSize: 80,
        color: const Color.fromARGB(255, 72, 50, 40),

        fontWeight: FontWeight.bold,
      ),
    );
  }
}
