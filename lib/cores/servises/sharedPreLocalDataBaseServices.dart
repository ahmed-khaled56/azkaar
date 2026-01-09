import 'package:azkaar/features/azkarr/data/repos/models/sebha_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaSharedPrefs {
  static const String _k1 = 'sebha_c1';
  static const String _k2 = 'sebha_c2';
  static const String _k3 = 'sebha_c3';
  static const String _k4 = 'sebha_c4';
  static const String _k5 = 'sebha_c5';
  static const String _k6 = 'record_s1';
  static const String _k7 = 'srecord_s2';
  static const String _k8 = 'record_s3';
  static const String _k9 = 'record_s4';
  static const String _k10 = 'record_s5';

  /// حفظ الداتا
  static Future<void> save(SebhaModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_k1, model.c1);
    await prefs.setInt(_k2, model.c2);
    await prefs.setInt(_k3, model.c3);
    await prefs.setInt(_k4, model.c4);
    await prefs.setInt(_k5, model.c5);
  }

  static Future<void> saveRecord(recordModel record) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_k6, record.s1);
    await prefs.setInt(_k7, record.s2);
    await prefs.setInt(_k8, record.s3);
    await prefs.setInt(_k9, record.s4);
    await prefs.setInt(_k10, record.s5);
  }

  /// قراءة الداتا
  static Future<SebhaModel> load() async {
    final prefs = await SharedPreferences.getInstance();
    return SebhaModel(
      c1: prefs.getInt(_k1) ?? 0,
      c2: prefs.getInt(_k2) ?? 0,
      c3: prefs.getInt(_k3) ?? 0,
      c4: prefs.getInt(_k4) ?? 0,
      c5: prefs.getInt(_k5) ?? 0,
    );
  }

  static Future<recordModel> loadRecord() async {
    final prefs = await SharedPreferences.getInstance();
    return recordModel(
      s1: prefs.getInt(_k6) ?? 0,
      s2: prefs.getInt(_k7) ?? 0,
      s3: prefs.getInt(_k8) ?? 0,
      s4: prefs.getInt(_k9) ?? 0,
      s5: prefs.getInt(_k10) ?? 0,
    );
  }

  /// تصفير
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_k1);
    await prefs.remove(_k2);
    await prefs.remove(_k3);
    await prefs.remove(_k4);
    await prefs.remove(_k5);
  }

  static Future<void> clearRewcord() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_k6);
    await prefs.remove(_k7);
    await prefs.remove(_k8);
    await prefs.remove(_k9);
    await prefs.remove(_k10);
  }
}
