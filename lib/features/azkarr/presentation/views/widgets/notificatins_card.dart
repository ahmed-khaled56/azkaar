import 'package:azkaar/cores/helper/time_picker.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/Custom_on_buttn.dart';
import 'package:flutter/material.dart';

class NotificatinsCard extends StatefulWidget {
  const NotificatinsCard({super.key});

  @override
  State<NotificatinsCard> createState() => _NotificatinsCardState();
}

bool OnIsPressed = false;
int? hour;
int? min;
DayPeriod? status;
ValueChanged<TimeOfDay>? onTimeSelected;

class _NotificatinsCardState extends State<NotificatinsCard> {
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await pickerTime(context);

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        hour = pickedTime.hour;
        min = pickedTime.minute;
        status = pickedTime.period;
      });
    }
  }

  bool showDropDown = false;
  bool showDropDown1 = false;
  String selectedValue = "1";
  String selectedValue1 = "1";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: 370,
          height: 150,
          decoration: BoxDecoration(
            color: Color(0xfff5d59c),

            borderRadius: BorderRadius.circular(16),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Spacer(),
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
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Icon(Icons.calendar_month_rounded),
                    ),
                    Spacer(flex: 5),
                    Text(
                      min != null || hour != null ? "$hour:$min" : "11:50",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    //   Spacer(),
                    status == DayPeriod.am
                        ? Text(
                            " AM",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            " PM",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                    Text(
                      " :  الوقت المحدد لارسال الاشعارات",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(value: '1', child: Text('دقيقه ')),
                            PopupMenuItem(value: '2', child: Text('10 دقائق')),
                            PopupMenuItem(value: '3', child: Text('ساعه')),
                          ],
                          child: Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 198, 123),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_drop_down),
                                if (selectedValue == '1') Text("دقيقه"),
                                if (selectedValue == '2')
                                  Text(
                                    "10 دقائق",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                if (selectedValue == '3') Text("ساعه"),
                              ],
                            ),
                          ),
                        ),

                        Text(":الفاصل بين الاشعارات"),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            setState(() {
                              selectedValue1 = value;
                            });
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(value: '1', child: Text('ساعة ')),
                            PopupMenuItem(value: '2', child: Text('ساعتين')),
                            PopupMenuItem(value: '3', child: Text('3 ساعات')),
                          ],
                          child: Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 198, 123),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_drop_down),
                                if (selectedValue1 == '1') Text("ساعه"),
                                if (selectedValue1 == '2')
                                  Text(
                                    "ساعتين",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                if (selectedValue1 == '3')
                                  Text(
                                    "3 ساعات",
                                    style: TextStyle(fontSize: 10),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 2),

                        Text(":وقت الانتهاء"),
                      ],
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
