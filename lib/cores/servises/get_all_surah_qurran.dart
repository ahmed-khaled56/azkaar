import 'package:azkaar/cores/helper/API.dart';

class GetAllSurahQurran {
  Future<List<dynamic>> getAllSurahQurran() async {
    List<dynamic> data = await API().get(
      url: 'http://api.alquran.cloud/v1/quran',
    );

    return data;
  }
}
