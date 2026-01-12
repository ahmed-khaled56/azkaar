import 'package:azkaar/cores/servises/local_notification_service.dart';
import 'package:azkaar/features/azkarr/data/repos/models/alsaatimesmodel/timings.dart';

DateTime _parsePrayerTime(String time) {
  final now = DateTime.now();
  final parts = time.split(':');

  DateTime dateTime = DateTime(
    now.year,
    now.month,
    now.day,
    int.parse(parts[0]),
    int.parse(parts[1]),
  );

  if (dateTime.isBefore(now)) {
    dateTime = dateTime.add(const Duration(days: 1));
  }

  return dateTime;
}

Future<void> scheduleAllPrayers(Timings times) async {
  await LaocalNotificationService.cancelAll();

  final prayers = {
    1: {'name': 'الفجر', 'time': times.fajr},
    2: {'name': 'الظهر', 'time': times.dhuhr},
    3: {'name': 'العصر', 'time': times.asr},
    4: {'name': 'المغرب', 'time': times.maghrib},
    5: {'name': 'العشاء', 'time': times.isha},
  };

  for (final prayer in prayers.entries) {
    if (prayer.value['time'] == null) continue;

    final dateTime = _parsePrayerTime(prayer.value['time']!);

    await LaocalNotificationService.showSchdulNotification(
      id: prayer.key,
      title: '🕌 موعد صلاة ${prayer.value['name']}',
      body: 'حان الآن وقت صلاة ${prayer.value['name']}',
      time: dateTime,
    );
  }
}
