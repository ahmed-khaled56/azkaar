import 'package:azkaar/features/azkarr/presentation/views/widgets/night_azkaar_body.dart';
import 'package:flutter/material.dart';

class NightAzkarrView extends StatelessWidget {
  const NightAzkarrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: Icon(Icons.more_vert),
        title: Center(child: Text("أذكار المساء")),
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
      body: NightAzkaarBody(),
    );
  }
}
