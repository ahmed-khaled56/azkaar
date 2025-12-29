import 'package:azkaar/features/azkarr/presentation/views/widgets/morning_azkar_body.dart';
import 'package:flutter/material.dart';

class MorningAzkarView extends StatelessWidget {
  const MorningAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: Icon(Icons.more_vert),
        title: Center(child: Text("أذكار الصباح")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_forward),
            ),
          ),
        ],

        backgroundColor: Color(0xfff5d59c),
      ),
      body: MorningAzkarBody(),
    );
  }
}
