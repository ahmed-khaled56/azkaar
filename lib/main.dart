import 'package:azkaar/cores/servises/local_notification_service.dart';
import 'package:azkaar/features/azkarr/presentation/manager/salaaTimes_cubit.dart/salaaTimes_cubit.dart';
import 'package:azkaar/features/quraan/presentation/manager/qurran_cubit/quraan_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuraanCubit>(create: (context) => QuraanCubit()),
        BlocProvider<SalaatimesCubit>(create: (context) => SalaatimesCubit()),
      ],

      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeView()),
    );
  }
}
