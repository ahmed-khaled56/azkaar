import 'package:azkaar/cores/helper/time_picker.dart';
import 'package:azkaar/cores/servises/local_notification_service.dart';
import 'package:azkaar/cores/servises/work_manager_services.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/Custom_on_buttn.dart';
import 'package:flutter/material.dart';

class NightBotifCard extends StatefulWidget {
  const NightBotifCard({super.key});

  @override
  State<NightBotifCard> createState() => _NightBotifCardState();
}

bool OnIsPressed = false;
int? hour;
int? min;
DayPeriod? status;
ValueChanged<TimeOfDay>? onTimeSelected;

class _NightBotifCardState extends State<NightBotifCard> {
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
  List<String> MorningAzkar = [
    "أصبحنا و أصبح الملك لله، و الحمد لله، لا إله إلا الله وحده لا شريك له، له الملك و له الحمد وهو على كل شئ قدير، رب أسألك خير ما في هذا اليوم  و خير ما بعده، وأعوذ بك من شر ما في هذا اليوم و شر ما بعده، رب أعوذ بك من الكسل، و سوء الكبر، رب أعوذ بك من عذاب في النار و عذاب في القبر",
    "اللهم بك أصبحنا، و بك أمسينا، و بك نحيا، و بك نموت، و اليك النشور",
    " اللهم أنت ربي لا إله إلا أنت، خلقتني و أنا عبدك، و أنا على عهدك و وعدك ما استطعت، أعوذ بك من شر ما صنعت، أبوء لك بنعمتك علي، و أبوء بذنبي فاغفر لي فإنه لا يغفر الذنوب إلا أنت ",
    " اللهم إني أصبحت أشهد ك  و أشهد حملة عرشك، و ملائكتك  و جميع خلقك، أنك أنت الله لا إله إلا أنت وحدك لا شريك لك، و أن محمدا عبدك و رسولك - (أربع مرات)",

    " اللهم ما أصبح بي من نعمة أو بأحد من خلقك فمنك  وحدك لا شريك لك، فلك الحمد ولك الشكر ",

    " اللهم عافني في بدني، اللهم عافني في سمعي، اللهم عافني في بصري، لا إله إلا أنت . اللهم إني أعوذ بك من الكفر، و الفقر، و أعوذ بك من عذاب القبر، لا إله إلا أنت - (ثلاث مرات) ",

    " حسبي الله لا إله إلا هو عليه توكلت و هو رب العرش العظيم - (سبع مرات) ",

    " اللهم إني أسألك العفو و العافية في الدنيا و الأخره، اللهم  إني أسألك العفو و العافية، في ديني و دنياي و أهلي، و مالي، اللهم استر عوراتي، و آمن روعاتي، اللهم احفظني من بين يدي، و من خلفي، و عن يميني، و عن شمالي،  و من فوقي، و أعوذ بعظمتك إن أغتال من تحتي  ",

    " اللهم عالم الغيب و الشهادة فاطر السموات و الأرض، رب كل شئ و مليكه، أشهد أن لا إله إلا أنت، أعوذ بك من شر نفسي، و من شر الشيطان و شركه، و أن أقترف على نفسي سوءا، أو أجره إلى مسلم ",

    " بسم الله الذي لا يضر مع اسمه شئ في الأرض و لا في السماء وهو السميع العليم - (ثلاث مرات) ",

    " رضيت بالله ربا، و بالإسلام دينا، و بمحمد صلى الله عليه و سلم نبيا - (ثلاث مرات) ",

    " يا حي يا قيوم برحمتك أستغيث أصلح لي شأني كله و لا تكلني إلى نفسي طرفة عين ",

    " أصبحنا و أصبح الملك لله رب العالمين، اللهم إني أسألك خير هذا اليوم : فتحه، و نصره و نوره و بركته و هداه، و أعوذ بك من شر ما فيه و شره ما بعده ",

    " أصبحنا على فطرة الإسلام وعلى كلمة الإخلاص، و على دين نبينا محمد صلى الله عليه وسلم، وعلى ملة أبينا إبراهيم، حنيفا مسلما وما كان من المشركين ",

    " سبحان الله و بحمده - (مائة مره) ",

    " لا إله إلا الله وحده لا شريك له، له الملك و له الحمد، وهو على كل شئ قدير - (عشر مرات) أو (مرة واحدة عند الكسل) ",

    " لا إله إلا الله، وحده لا شريك له، له الملك وله الحمد و هو على كل شئ قدير- (مائة مرة إذا أصبح) ",

    " سبحان الله و بحمده : عدد خلقه، و رضا نفسه، و زنة عرشه، و مداد كلماته - (ثلاث مرات أذا أصبح) ",
  ];
  // Future<void> checkScheduleFromWorkManager() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final needSchedule = prefs.getBool('need_schedule') ?? false;

  //   if (needSchedule) {
  //     LaocalNotificationService.showSchdulNotification();
  //     await prefs.setBool('need_schedule', false);
  //   }
  // }

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
                      onTap: () async {
                        // await checkScheduleFromWorkManager();
                        setState(() {
                          OnIsPressed = !OnIsPressed;
                          WorkManagerServices().init(
                            key: selectedValue,
                            repeatedtime: 1,
                            hour: hour ?? 8,
                            min: min ?? 0,
                          );
                          LaocalNotificationService.showSchdulNotification(
                            hour: hour ?? 8,
                            min: min ?? 0,
                          );
                          LaocalNotificationService.setEndTime(
                            stopTime: selectedValue1,
                          );
                        });
                      },
                      child: customOnButton(
                        color: Colors.black,
                        pressed: OnIsPressed,
                      ),
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
                            PopupMenuItem(value: '1', child: Text('ربع ساعه ')),
                            PopupMenuItem(value: '2', child: Text('يوميا')),
                            PopupMenuItem(value: '3', child: Text('ساعه')),
                            //PopupMenuItem(value: '4', child: Text('اسبوعيا')),
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
                                if (selectedValue == '1')
                                  Text(
                                    "ربع ساعه",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                if (selectedValue == '2')
                                  Text("يوميا", style: TextStyle(fontSize: 10)),
                                if (selectedValue == '3') Text("ساعه"),
                                // if (selectedValue == '4')
                                //   Text(
                                //     "اسبوعيا",
                                //     style: TextStyle(fontSize: 9),
                                //   ),
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
