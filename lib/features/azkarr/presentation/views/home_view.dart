import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/quraan_cubit.dart';
import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/qurran_cubit_states.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  // BlocProvider(

  //       child: Builder(
  //         builder: (context) {
  //           return BlocBuilder<QuraanCubit, QurranCubitStates>(
  //             builder: (context, state) {
  //   @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Color(0xff1d7d84),
        title: Center(
          child: Text(
            'وذكّر',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
      body: HomeViewBody(),
    );
  }
}
