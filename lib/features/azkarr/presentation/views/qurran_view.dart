import 'dart:math';

import 'package:azkaar/cores/helper/show_snak_bar.dart';
import 'package:azkaar/features/azkarr/data/models/quraan_mode/quraan_mode.dart';
import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/quraan_cubit.dart';
import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/qurran_cubit_states.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/qurran_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QurranView extends StatefulWidget {
  const QurranView({super.key});

  @override
  State<QurranView> createState() => _QurranViewState();
}

class _QurranViewState extends State<QurranView> {
  @override
  List<QuraanMode> dataList = [];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Color(0xff1d7d84),
        title: Center(
          child: Text("القران الكريم", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: BlocConsumer<QuraanCubit, QurranCubitStates>(
        listener: (context, state) {
          if (state is QuraanFailureSatate) {
            showSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is NoQuraanState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is QuraanLoadedSuccessfullSatate) {
            return QurranViewBody(dataList: state.quraanModeList);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
