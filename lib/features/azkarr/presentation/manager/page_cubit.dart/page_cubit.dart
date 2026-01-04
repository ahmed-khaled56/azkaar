import 'package:azkaar/cores/servises/gat_pages_service.dart';
import 'package:azkaar/features/azkarr/presentation/manager/page_cubit.dart/page_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuranPageCubit extends Cubit<QuranPageState> {
  QuranPageCubit() : super(QuranPageInitial());

  Future<void> getPage(int pageNumber) async {
    emit(QuranPageLoading());
    try {
      final ayahs = await GetQuranPageService().getQuranPage(pageNumber);
      emit(QuranPageSuccess(ayahs));
    } catch (e) {
      emit(QuranPageFailure(e.toString()));
    }
  }
}
