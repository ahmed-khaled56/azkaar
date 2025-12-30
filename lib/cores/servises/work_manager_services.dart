import 'package:azkaar/cores/servises/local_notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

int _hour = 0;
int _min = 0;

class WorkManagerServices {
  Future<void> registerMyTask({
    required String kay,
    required int repeatedtime,
  }) async {
    await Workmanager().registerPeriodicTask(
      "id1",
      "Show Notification Task",

      frequency: kay == "ربع ساعه"
          ? Duration(minutes: repeatedtime)
          : kay == "يوميا"
          ? Duration(days: repeatedtime)
          : Duration(hours: repeatedtime),
    );
  }

  void cancelTask({required String id}) {
    Workmanager().cancelByUniqueName(id);
  }

  Future<void> init({
    required String key,
    required int repeatedtime,
    required int hour,
    required int min,
  }) async {
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    registerMyTask(kay: key, repeatedtime: repeatedtime);
    _hour = hour;
    _min = min;
  }
}

@pragma('vm:entry-point')
Future<void> actionTask() async {
  Workmanager().executeTask((taskName, inputData) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('need_schedule', true);
    await LaocalNotificationService.showSchdulNotification(
      hour: _hour,
      min: _min,
    );
    return Future.value(true);
  });
}
