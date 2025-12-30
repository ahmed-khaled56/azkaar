import 'package:azkaar/features/azkarr/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd4d4aa),
        title: Center(
          child: Text("وذَكّر", style: TextStyle(color: Colors.black)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: Icon(Icons.arrow_forward_rounded),
          ),
        ],
      ),
      backgroundColor: Color(0xff073542),
      body: HomeViewBody(),
    );
  }
}
