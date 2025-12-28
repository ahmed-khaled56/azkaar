import 'package:flutter/material.dart';

TimeOfDay selectedTime = TimeOfDay.now();
Future<TimeOfDay?> pickerTime(BuildContext context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: selectedTime,
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );
    },
  );
  return pickedTime;
}
