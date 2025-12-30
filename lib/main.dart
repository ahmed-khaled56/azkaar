import 'package:azkaar/cores/servises/local_notification_service.dart';
import 'package:azkaar/cores/servises/work_manager_services.dart';
import 'package:azkaar/features/azkarr/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  // Future.wait([]);
  await LaocalNotificationService.initLocalNotify();
  //await WorkManagerServices().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
