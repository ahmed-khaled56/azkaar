import 'package:azkaar/features/azkarr/presentation/views/widgets/Custom_Prayer_row.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/Custom_on_buttn.dart';
import 'package:flutter/material.dart';

class PrayertimesBody extends StatefulWidget {
  const PrayertimesBody({super.key});

  @override
  State<PrayertimesBody> createState() => _PrayertimesBodyState();
}

class _PrayertimesBodyState extends State<PrayertimesBody> {
  bool OnIsPressed = false;
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
              CustomPrayerRow(
                time: "5:30 AM",
                name: ":الفجر",
                iconLink: "lib/cores/assets/images/f.png",
              ),
              CustomPrayerRow(
                time: "6:46 AM",
                name: ":الصبح",
                iconLink: "lib/cores/assets/images/sob.png",
              ),
              CustomPrayerRow(
                time: "11:52 AM",
                name: ":الظهر",
                iconLink: "lib/cores/assets/images/dohr.png",
              ),
              CustomPrayerRow(
                time: "2:38 PM",
                name: ":العصر",
                iconLink: "lib/cores/assets/images/as.png",
              ),
              CustomPrayerRow(
                time: "4:57 PM",
                name: ":المغرب",
                iconLink: "lib/cores/assets/images/magh.png",
              ),
              CustomPrayerRow(
                time: "6:20 PM",
                name: ":العشاء",
                iconLink: "lib/cores/assets/images/isha.png",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
