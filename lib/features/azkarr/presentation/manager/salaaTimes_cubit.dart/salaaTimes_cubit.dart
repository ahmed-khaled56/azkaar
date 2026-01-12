import 'package:azkaar/cores/servises/slalaa_services.dart';
import 'package:azkaar/features/azkarr/data/repos/models/alsaatimesmodel/timings.dart';
import 'package:azkaar/features/azkarr/presentation/manager/salaaTimes_cubit.dart/salahTimes_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalaatimesCubit extends Cubit<SalahtimesCubitStates> {
  SalaatimesCubit() : super(salahtimesInitial());

  Future<void> getSalahTimes() async {
    emit(salahtimesLoading());

    try {
      final Timings times = await SlalaaServices().getAllSalahTimes();

      emit(salahtimesSuccess(times));
    } catch (e) {
      emit(salahtimesFailure(e.toString()));
    }
  }
}
