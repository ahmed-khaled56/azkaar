import 'package:azkaar/cores/helper/API.dart';
import 'package:azkaar/features/azkarr/data/repos/models/alsaatimesmodel/timings.dart';

class SlalaaServices {
  Future<Timings> getAllSalahTimes() async {
    final data = await API().get(
      url:
          'https://api.aladhan.com/v1/timingsByCity?city=Cairo&country=Egypt&method=5',
    );

    return Timings.fromJson(data['data']['timings']);
  }
}
