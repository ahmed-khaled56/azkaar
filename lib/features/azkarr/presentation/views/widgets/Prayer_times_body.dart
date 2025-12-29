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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    OnIsPressed = !OnIsPressed;
                  });
                },
                child: customOnButton(pressed: OnIsPressed),
              ),
              Spacer(),

              Text("فعل الاشعارات", style: TextStyle(fontSize: 20)),
            ],
          ),
          Text(
            "مواقيت الصلاه",

            style: TextStyle(
              fontWeight: FontWeight.bold,

              fontSize: 30,
              color: Color(0xfff5d59c),
            ),
          ),

          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              color: Color(0xfff5d59c),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "5:30 PM",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    ":الفجر",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),

                  Image(
                    width: 50,
                    height: 50,
                    image: AssetImage("lib/cores/assets/images/doha.png"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
