import 'package:flutter/material.dart';

class RecordRow extends StatelessWidget {
  const RecordRow({super.key, required this.count, required this.name});

  final int count;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$count",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
