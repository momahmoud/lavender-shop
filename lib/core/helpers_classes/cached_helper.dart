import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBoolean({
    required String key,
  }) {
    return sharedPreferences.getBool(key);
  }

  static Future<bool> saveCachedData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getCachedData(
      {required String key, required dynamic returnType}) {
    if (returnType is String) return sharedPreferences.getString(key);
    if (returnType is int) return sharedPreferences.getInt(key);
    if (returnType is bool) return sharedPreferences.getBool(key);
    return sharedPreferences.getDouble(key);
  }

  static Future<bool> clearCachedData({required String key}) {
    return sharedPreferences.remove(key);
  }
}
