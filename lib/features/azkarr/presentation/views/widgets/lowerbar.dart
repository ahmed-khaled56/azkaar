import 'package:flutter/material.dart';

class Lowerbar extends StatelessWidget {
  const Lowerbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Spacer(),
          Transform.rotate(
            angle: 90,
            child: Icon(Icons.density_medium_rounded),
          ),
          Spacer(),
          Icon(Icons.density_medium_rounded),
          Spacer(),
          Icon(Icons.density_medium_rounded),
          Spacer(),
        ],
      ),
    );
  }
}
