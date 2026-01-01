import 'package:azkaar/cores/servises/local_notification_service.dart';
import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/quraan_cubit.dart';
import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/qurran_cubit_states.dart';
import 'package:azkaar/features/azkarr/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timezone/data/latest.dart' as tz;

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
  // BlocProvider(
  //       create: (context) => QuraanCubit(),
  //       child: BlocBuilder<QuraanCubit, QurranCubitStates>(
  //         builder: (context, state) {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuraanCubit(),
      child: BlocBuilder<QuraanCubit, QurranCubitStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          );
        },
      ),
    );
  }
}
