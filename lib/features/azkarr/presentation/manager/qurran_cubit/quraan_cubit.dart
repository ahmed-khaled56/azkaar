import 'package:azkaar/cores/servises/get_all_surah_qurran.dart';
import 'package:azkaar/features/azkarr/data/models/quraan_mode/ayah.dart';
import 'package:azkaar/features/azkarr/data/models/quraan_mode/quraan_mode.dart';
import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/qurran_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuraanCubit extends Cubit<QurranCubitStates> {
  QuraanCubit() : super(NoQuraanState());
  List? quraanModeList;
  List? ayaHList;
  List<Ayah> ayahsFinalList = [];
  // Future<void> getAllSurahqurran() async {
  //   try {
  //     quraanModeList = await GetAllSurahQurranService().getAllSurahQurran();
  //     final List<QuraanMode> quraanList = quraanModeList!
  //         .map((e) => QuraanMode.fromJson(e as Map<String, dynamic>))
  //         .toList();

  //     emit(QuraanLoadedSuccessfullSatate(quraanModeList: quraanList));
  //   } catch (e) {
  //     emit(QuraanFailureSatate(errMessage: e.toString()));
  //   }
  // }

  Future<void> getAllSurahqurran() async {
    try {
      final rawList = await GetAllSurahQurranService().getAllSurahQurran();

      final List<QuraanMode> quraanList = rawList
          .where((e) => e != null && e is Map<String, dynamic>)
          .map((e) => QuraanMode.fromJson(e))
          .toList();

      emit(QuraanLoadedSuccessfullSatate(quraanModeList: quraanList));
    } catch (e) {
      emit(QuraanFailureSatate(errMessage: e.toString()));
    }
  }
}
