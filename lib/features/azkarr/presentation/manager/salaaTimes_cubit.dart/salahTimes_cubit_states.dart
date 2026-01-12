import 'package:azkaar/features/azkarr/data/repos/models/alsaatimesmodel/timings.dart';

abstract class SalahtimesCubitStates {}

class salahtimesInitial extends SalahtimesCubitStates {}

class salahtimesLoading extends SalahtimesCubitStates {}

class salahtimesSuccess extends SalahtimesCubitStates {
  final Timings times;
  salahtimesSuccess(this.times);
}

class salahtimesFailure extends SalahtimesCubitStates {
  final String errMessage;
  salahtimesFailure(this.errMessage);
}
