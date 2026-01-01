import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/quraan_cubit.dart';
import 'package:azkaar/features/azkarr/presentation/views/Prayer_times_view.dart';
import 'package:azkaar/features/azkarr/presentation/views/morning_azkar_view.dart';
import 'package:azkaar/features/azkarr/presentation/views/night_azkarr_view.dart';
import 'package:azkaar/features/azkarr/presentation/views/qurran_view.dart';
import 'package:azkaar/features/azkarr/presentation/views/sebha_view.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/custom_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NightAzkarrView()),
              );
            },
            child: CustomCategoryCard(title: "أذكار المساء"),
          ),
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
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QurranView()),
              );
              await BlocProvider.of<QuraanCubit>(context).getAllSurahqurran();
            },
            child: CustomCategoryCard(title: "قرأن كريم"),
          ),
        ],
      ),
    );
  }
}
