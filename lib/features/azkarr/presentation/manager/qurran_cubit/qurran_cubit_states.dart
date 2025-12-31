import 'package:azkaar/features/azkarr/data/models/quraan_mode/quraan_mode.dart';

class QurranCubitStates {}

class NoQuraanState extends QurranCubitStates {}

class QuraanLoadedSuccessfullSatate extends QurranCubitStates {
  final List<QuraanMode> quraanModeList;

  QuraanLoadedSuccessfullSatate({required this.quraanModeList});
}

class QuraanFailureSatate extends QurranCubitStates {
  final String errMessage;

  QuraanFailureSatate({required this.errMessage});
}
