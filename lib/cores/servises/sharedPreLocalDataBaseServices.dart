import 'package:azkaar/features/azkarr/data/repos/models/sebha_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaSharedPrefs {
  static const String _k1 = 'sebha_c1';
  static const String _k2 = 'sebha_c2';
  static const String _k3 = 'sebha_c3';
  static const String _k4 = 'sebha_c4';
  static const String _k5 = 'sebha_c5';

  /// حفظ الداتا
  static Future<void> save(SebhaModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_k1, model.c1);
    await prefs.setInt(_k2, model.c2);
    await prefs.setInt(_k3, model.c3);
    await prefs.setInt(_k4, model.c4);
    await prefs.setInt(_k5, model.c5);
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

  /// تصفير
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_k1);
    await prefs.remove(_k2);
    await prefs.remove(_k3);
    await prefs.remove(_k4);
    await prefs.remove(_k5);
  }
}
