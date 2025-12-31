import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/quraan_cubit.dart';
import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/qurran_cubit_states.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/qurran_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QurranView extends StatelessWidget {
  const QurranView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuraanCubit(),

      child: Builder(
        builder: (context) {
          return BlocBuilder<QuraanCubit, QurranCubitStates>(
            builder: (context, state) {
              return Scaffold(body: QurranViewBody());
            },
          );
        },
      ),
    );
  }
}
