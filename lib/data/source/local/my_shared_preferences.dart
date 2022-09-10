import 'package:shared_preferences/shared_preferences.dart';

import 'my_shared_preferences_keys.dart';

class MySharedPreferences {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void putBoolean({
    required MySharedKeys key,
    required bool value,
  }) async {
    await _preferences?.setBool(key.name, value);
  }

  static bool getBoolean({required MySharedKeys key}) {
    return _preferences?.getBool(key.name) ?? false;
  }

  static void putString({
    required MySharedKeys key,
    required String? value,
  }) async {
    await _preferences?.setString(key.name, value ?? "");
  }

  static String getString({required MySharedKeys key}) {
    return _preferences?.getString(key.name) ?? "";
  }

  static Future<bool>? clearShared() {
    return _preferences?.clear();
  }

  static String getCurrentLanguage() {
    return _preferences?.getString(MySharedKeys.language.name) ?? "en";
  }
}
