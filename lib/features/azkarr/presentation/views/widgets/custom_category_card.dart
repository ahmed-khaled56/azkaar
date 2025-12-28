import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            width: 400,
            height: 100,

            image: AssetImage("lib/cores/assets/images/fram.png"),
          ),

          Text(title, style: TextStyle(fontSize: 20, color: Colors.amber)),
        ],
      ),
    );
  }
}
