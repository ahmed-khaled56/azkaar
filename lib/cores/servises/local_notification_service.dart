import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LaocalNotificationService {
  static int _hour = 0;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static void ontap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future<void> initLocalNotify() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(settings);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static Future<void> basicNotofication() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        "id 0",
        "Basic notifications",
        priority: Priority.high,
        importance: Importance.max,
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      0,

      "Local Basic notification",
      "hello every body",
      details,
      payload: "Payload data",
    );
  }

  static Future<void> reabatedNotification({
    required RepeatInterval interval,
  }) async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        "id 1",
        "Repeated notifications",
        priority: Priority.high,
        importance: Importance.max,
      ),
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      // androidScheduleMode: AndroidScheduleMode.alarmClock,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      1,

      "أذكار الصباح",
      "لا تنسي وردك اليومي من اذكار الصباح",
      interval,
      details,
      payload: "Payload data",
    );
  }

  static Future<void> showSchdulNotification({
    required int hour,
    required int min,
  }) async {
    _hour = hour;
    NotificationDetails Details = NotificationDetails(
      android: AndroidNotificationDetails(
        "id 3",
        "sheduled Channel",
        priority: Priority.high,
        importance: Importance.max,
      ),
    );

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    var currentTime = tz.TZDateTime.now(tz.local);
    var sheduledTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      hour,
      min,
    );
    if (sheduledTime.isBefore(currentTime)) {
      sheduledTime = sheduledTime.add(const Duration(days: 1));
    }
    final now = tz.TZDateTime.now(tz.local);
    if (endTime != null && now.isAfter(endTime!)) {
      await flutterLocalNotificationsPlugin.cancelAll();
      return;
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      2,
      "أذكار الصباح",
      "لا تنسي وردك اليومي من اذكار الصباح",
      sheduledTime,
      Details,

      payload: "Payload Data",
    );
  }
  //     android: AndroidNotificationDetails(
  //       "id 2",
  //       "Scheduled notifications",
  //       priority: Priority.high,
  //       importance: Importance.max,
  //     ),
  //   );

  //   tz.initializeTimeZones();
  //   final timeZoneInfo = await FlutterTimezone.getLocalTimezone();

  //   tz.setLocalLocation(tz.getLocation(timeZoneInfo.identifier));

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     androidScheduleMode: AndroidScheduleMode.alarmClock,
  //     2,

  //     "local Scheduled notification",
  //     "hello every body",
  //     tz.TZDateTime(tz.local, 2025, 12, 31, 16, 41),
  //     details,

  //     payload: "Payload data",
  //   );
  // }

  //   static Future<void> pushForeground({required RemoteMessage message}) async {
  //     NotificationDetails details = NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         "id 0",
  //         "Basic notifications",
  //         priority: Priority.high,
  //         importance: Importance.max,
  //       ),
  //     );
  //     await flutterLocalNotificationsPlugin.show(
  //       0,

  //       message.notification!.title ?? "0",
  //       message.notification!.body ?? "0",
  //       details,
  //       payload: "Payload data",
  //     );
  //   }
  // }
  static tz.TZDateTime? endTime;

  static void setEndTime({required String stopTime}) {
    final now = tz.TZDateTime.now(tz.local);
    endTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      stopTime == "ساعه"
          ? _hour + 1
          : stopTime == "ساعتين"
          ? _hour + 2
          : _hour + 3,
    );

    if (endTime!.isBefore(now)) {
      endTime = endTime!.add(const Duration(days: 1));
    }
  }
}
