import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalDatasource {
  Future<bool> saveToggle(bool isDark) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setBool('theme-key', isDark);
    return result;
  }

  Future<bool> getToggle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool('theme-key');
    return result ?? false;
  }

  Future<bool> removeToggle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove('theme-key');
  }
}
