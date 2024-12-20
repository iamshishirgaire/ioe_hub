import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class AppSharedPreferences {
  Future<SharedPreferences> getSp() async {
    return await SharedPreferences.getInstance();
  }

  // Save a value to SharedPreferences
  Future<void> saveString(String key, String value) async {
    final sp = await getSp();
    await sp.setString(key, value);
  }

  //int
  Future<void> saveInt(String key, int value) async {
    final sp = await getSp();
    await sp.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final sp = await getSp();
    return sp.getInt(key);
  }

  // Retrieve a value from SharedPreferences
  Future<String?> getString(String key) async {
    final sp = await getSp();
    return sp.getString(key);
  }

  // Save a boolean value to SharedPreferences
  Future<void> saveBool(String key, bool value) async {
    final sp = await getSp();
    await sp.setBool(key, value);
  }

  // Retrieve a boolean value from SharedPreferences
  Future<bool?> getBool(String key) async {
    final sp = await getSp();
    return sp.getBool(key);
  }

  // Remove a key from SharedPreferences
  Future<void> remove(String key) async {
    final sp = await getSp();
    await sp.remove(key);
  }

  // Clear all SharedPreferences
  Future<void> clear() async {
    final sp = await getSp();
    await sp.clear();
  }
}
