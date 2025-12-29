import 'package:azkaar/features/azkarr/presentation/views/Prayer_times_view.dart';
import 'package:azkaar/features/azkarr/presentation/views/morning_azkar_view.dart';
import 'package:azkaar/features/azkarr/presentation/views/sebha_view.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/custom_category_card.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MorningAzkarView()),
              );
            },
            child: CustomCategoryCard(title: "أذكار الصباح"),
          ),
          CustomCategoryCard(title: "أذكار المساء"),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrayertimesView()),
              );
            },
            child: CustomCategoryCard(title: " مواقيت الصلاه"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SebhaView()),
              );
            },
            child: CustomCategoryCard(title: "سبحه"),
          ),
          CustomCategoryCard(title: "قرأن كريم"),
        ],
      ),
    );
  }
}
