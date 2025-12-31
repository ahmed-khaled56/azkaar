import 'package:azkaar/cores/servises/get_all_surah_qurran.dart';
import 'package:azkaar/features/azkarr/data/models/quraan_mode/quraan_mode.dart';
import 'package:azkaar/features/azkarr/presentation/manager/qurran_cubit/qurran_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuraanCubit extends Cubit<QurranCubitStates> {
  QuraanCubit() : super(NoQuraanState());
  List<dynamic>? quraanMode;
  getWeather({required String cityName}) async {
    try {
      quraanMode = await GetAllSurahQurran().getAllSurahQurran();

      emit(
        QuraanLoadedSuccessfullSatate(
          quraanModeList: quraanMode!
              .map((e) => QuraanMode.fromJson(e))
              .toList(),
        ),
      );
    } catch (e) {
      emit(QuraanFailureSatate(errMessage: e.toString()));
    }
  }
}
