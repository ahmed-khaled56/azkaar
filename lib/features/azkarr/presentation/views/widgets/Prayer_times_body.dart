import 'package:azkaar/cores/helper/prayersTomesNotification.dart';
import 'package:azkaar/cores/helper/show_snak_bar.dart';
import 'package:azkaar/cores/servises/local_notification_service.dart';
import 'package:azkaar/features/azkarr/data/repos/models/alsaatimesmodel/timings.dart';
import 'package:azkaar/features/azkarr/presentation/manager/salaaTimes_cubit.dart/salaaTimes_cubit.dart';
import 'package:azkaar/features/azkarr/presentation/manager/salaaTimes_cubit.dart/salahTimes_cubit_states.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/Custom_Prayer_row.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/Custom_on_buttn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrayertimesBody extends StatefulWidget {
  const PrayertimesBody({super.key});

  @override
  State<PrayertimesBody> createState() => _PrayertimesBodyState();
}

class _PrayertimesBodyState extends State<PrayertimesBody> {
  bool OnIsPressed = false;
  @override
  Timings? times;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "lib/cores/assets/images/gam.jpg",
            fit: BoxFit.cover,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        OnIsPressed = !OnIsPressed;
                      });
                      if (OnIsPressed) {
                        scheduleAllPrayers(times!);
                      } else {
                        LaocalNotificationService.cancelAll();
                      }
                    },
                    child: customOnButton(
                      color: Colors.white,
                      pressed: OnIsPressed,
                    ),
                  ),

                  //Spacer(flex: 2),
                  SizedBox(width: 190),
                  Text(
                    "فعل الاشعارات",
                    style: TextStyle(color: Color(0xfff5d59c), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Text(
                "مواقيت الصلاه",

                style: TextStyle(
                  fontWeight: FontWeight.bold,

                  fontSize: 30,
                  color: Color(0xfff5d59c),
                ),
              ),
              SizedBox(height: 80),
              BlocBuilder<SalaatimesCubit, SalahtimesCubitStates>(
                builder: (context, state) {
                  if (state is salahtimesFailure) {
                    showSnackBar(context, state.errMessage);
                  }
                  if (state is salahtimesSuccess) {
                    times = state.times;
                    return Column(
                      children: [
                        CustomPrayerRow(
                          time: "${times!.fajr} AM",
                          name: ":الفجر",
                          iconLink: "lib/cores/assets/images/f.png",
                        ),
                        CustomPrayerRow(
                          time: "${times!.sunrise} AM",
                          name: ":الصبح",
                          iconLink: "lib/cores/assets/images/sob.png",
                        ),
                        CustomPrayerRow(
                          time: "${times!.dhuhr} AM",
                          name: ":الظهر",
                          iconLink: "lib/cores/assets/images/dohr.png",
                        ),
                        CustomPrayerRow(
                          time: "${times!.asr} PM",
                          name: ":العصر",
                          iconLink: "lib/cores/assets/images/as.png",
                        ),
                        CustomPrayerRow(
                          time: "${times!.maghrib} PM",
                          name: ":المغرب",
                          iconLink: "lib/cores/assets/images/magh.png",
                        ),
                        CustomPrayerRow(
                          time: "${times!.isha} PM",
                          name: ":العشاء",
                          iconLink: "lib/cores/assets/images/isha.png",
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
