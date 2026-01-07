import 'package:azkaar/cores/servises/sharedPreLocalDataBaseServices.dart';
import 'package:azkaar/features/azkarr/data/repos/models/sebha_model.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/customTextCounter.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

import '../../../../../cores/widgets/Custom_recod_sheet.dart';

class SebhaViewBody extends StatefulWidget {
  const SebhaViewBody({super.key});

  @override
  State<SebhaViewBody> createState() => _SebhaViewBodyState();
}

class _SebhaViewBodyState extends State<SebhaViewBody> {
  String selectedValue = "1";
  String lable = "";
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int snap1 = 0;
  int snap2 = 0;
  int snap3 = 0;
  int snap4 = 0;
  int snap5 = 0;

  bool isReseted = false;
  SebhaModel sebha = SebhaModel();
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    sebha = await SebhaSharedPrefs.load();
    setState(() {
      count1 = sebha.c1;
      count2 = sebha.c2;
      count3 = sebha.c3;
      count4 = sebha.c4;
      count5 = sebha.c5;
    });
  }

  Future<void> _saveData() async {
    await SebhaSharedPrefs.save(sebha);
  }

  Future<void> _resetCountersOnly() async {
    sebha.c1 = 0;
    sebha.c2 = 0;
    sebha.c3 = 0;
    sebha.c4 = 0;
    sebha.c5 = 0;

    await SebhaSharedPrefs.save(sebha);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  if (snap1 == 0 &&
                      snap2 == 0 &&
                      snap3 == 0 &&
                      snap4 == 0 &&
                      snap5 == 0) {
                    snap1 = count1;
                    snap2 = count2;
                    snap3 = count3;
                    snap4 = count4;
                    snap5 = count5;
                  }
                  showDialog(
                    context: context,
                    builder: (_) => RecordSheet(
                      onDelete: () {
                        setState(() {
                          snap1 = snap2 = snap3 = snap4 = snap5 = 0;
                        });
                      },
                      c1: snap1,
                      c2: snap2,
                      c3: snap3,
                      c4: snap4,
                      c5: snap5,
                    ),
                  );
                  // RecordSheet(context, snap1, snap2, snap3, snap4, snap5);
                },
                child: Icon(Icons.history_toggle_off),
              ),
            ),
          ],
        ),
        Image(image: AssetImage("lib/cores/assets/images/sebha.png")),
        if (selectedValue == "1") counterText(count: count1),
        if (selectedValue == "2") counterText(count: count2),
        if (selectedValue == "3") counterText(count: count3),
        if (selectedValue == "4") counterText(count: count4),
        if (selectedValue == "5") counterText(count: count5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              itemBuilder: (context) => const [
                PopupMenuItem(value: '1', child: Text('استغفر الله ')),
                PopupMenuItem(value: '2', child: Text('الحمد لله')),
                PopupMenuItem(value: '3', child: Text(' سبحان الله')),
                PopupMenuItem(value: '4', child: Text('الله اكبر')),
                PopupMenuItem(value: '5', child: Text('لا اله الا الله')),
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_drop_down_circle_outlined, size: 30),
                  SizedBox(width: 20),
                  if (selectedValue == "1")
                    CustomButton2(
                      width: 280,
                      Textcolor: Colors.white,
                      buttoncolor: const Color.fromARGB(255, 88, 48, 37),
                      onPressed: () {
                        setState(() {
                          count1++;
                          snap1++;
                          sebha.c1 = count1;
                        });
                        _saveData();
                      },
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      lable: "أستغفر اللّه",
                    ),
                  if (selectedValue == "2")
                    CustomButton2(
                      width: 280,
                      Textcolor: Colors.white,
                      buttoncolor: const Color.fromARGB(255, 88, 48, 37),
                      onPressed: () {
                        setState(() {
                          count2++;
                          snap2++;
                          sebha.c2 = count2;
                        });
                        _saveData();
                      },
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      lable: "الحمد لله",
                    ),
                  if (selectedValue == "3")
                    CustomButton2(
                      width: 280,
                      Textcolor: Colors.white,
                      buttoncolor: const Color.fromARGB(255, 88, 48, 37),
                      onPressed: () {
                        setState(() {
                          count3++;
                          snap3++;
                          sebha.c3 = count3;
                        });
                        _saveData();
                      },
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      lable: "سبحان الله",
                    ),
                  if (selectedValue == "4")
                    CustomButton2(
                      width: 280,
                      Textcolor: Colors.white,
                      buttoncolor: const Color.fromARGB(255, 88, 48, 37),
                      onPressed: () {
                        setState(() {
                          count4++;
                          snap4++;
                          sebha.c4 = count4;
                        });
                        _saveData();
                      },
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      lable: " الله اكبر",
                    ),
                  if (selectedValue == "5")
                    CustomButton2(
                      width: 280,
                      Textcolor: Colors.white,
                      buttoncolor: const Color.fromARGB(255, 88, 48, 37),
                      onPressed: () {
                        setState(() {
                          count5++;
                          snap5++;
                          sebha.c5 = count5;
                        });
                        _saveData();
                      },
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      lable: "لا اله الا الله",
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    count1 = 0;
                    count2 = 0;
                    count3 = 0;
                    count4 = 0;
                    count5 = 0;
                  });
                  sebha = SebhaModel();
                  _resetCountersOnly();
                },
                child: Icon(Icons.refresh_outlined, size: 45),
              ),
              Spacer(),

              Text(
                "${sebha.total}",

                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                ":الأجمالي",

                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
