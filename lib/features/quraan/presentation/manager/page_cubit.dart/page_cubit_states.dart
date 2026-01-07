import 'package:azkaar/features/quraan/data/models/quraan_mode/ayah.dart';

abstract class QuranPageState {}

class QuranPageInitial extends QuranPageState {}

class QuranPageLoading extends QuranPageState {}

class QuranPageSuccess extends QuranPageState {
  final List<Ayah> ayahs;
  QuranPageSuccess(this.ayahs);
}

class QuranPageFailure extends QuranPageState {
  final String errMessage;
  QuranPageFailure(this.errMessage);
}
