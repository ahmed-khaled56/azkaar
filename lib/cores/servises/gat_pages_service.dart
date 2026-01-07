import 'package:azkaar/cores/helper/API.dart';
import 'package:azkaar/features/quraan/data/models/quraan_mode/ayah.dart';

class GetQuranPageService {
  Future<List<Ayah>> getQuranPage(int pageNumber) async {
    final data = await API().get(
      url: 'http://api.alquran.cloud/v1/page/$pageNumber/quran-uthmani',
    );

    final List ayahsJson = data['data']['ayahs'];

    return ayahsJson.map((e) => Ayah.fromJson(e)).toList();
  }
}
