import 'package:azkaar/cores/helper/API.dart';

class GetAllSurahQurranService {
  Future<List<dynamic>> getAllSurahQurran() async {
    Map<String, dynamic> data = await API().get(
      url: 'http://api.alquran.cloud/v1/quran',
    );
    List dataList = data['data']['surahs'];

    return dataList;
  }
}
