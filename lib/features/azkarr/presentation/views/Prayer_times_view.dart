import 'package:azkaar/features/azkarr/presentation/views/widgets/Prayer_times_body.dart';
import 'package:flutter/material.dart';

class PrayertimesView extends StatelessWidget {
  const PrayertimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003641),
      body: PrayertimesBody(),
    );
  }
}
