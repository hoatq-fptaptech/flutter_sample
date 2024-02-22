import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferenceKey {
  keyAccessToken,
}

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  static SharedPreferences? _sharedPreferences;

  static Future<SharedPreferencesManager> getInstance() async {
    _instance ??= SharedPreferencesManager();
    _sharedPreferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  Future<bool> putDouble(SharedPreferenceKey key, String value) =>
      _sharedPreferences!.setString(key.name, value);

  double? getDouble(SharedPreferenceKey key) =>
      _sharedPreferences!.getDouble(key.name);

  Future<bool> putInt(SharedPreferenceKey key, String value) =>
      _sharedPreferences!.setString(key.name, value);

  int? getInt(SharedPreferenceKey key) => _sharedPreferences!.getInt(key.name);

  Future<bool> putBool(SharedPreferenceKey key, String value) =>
      _sharedPreferences!.setString(key.name, value);

  bool? getBool(SharedPreferenceKey key) =>
      _sharedPreferences!.getBool(key.name);

  Future<bool> putString(SharedPreferenceKey key, String value) =>
      _sharedPreferences!.setString(key.name, value);

  String? getString(SharedPreferenceKey key) =>
      _sharedPreferences!.getString(key.name);

  Future<bool> putStringList(SharedPreferenceKey key, List<String> value) =>
      _sharedPreferences!.setStringList(key.name, value);

  List<String> getStringList(SharedPreferenceKey key) =>
      _sharedPreferences!.getStringList(key.name) ?? [];

  Future<void> removeByKey(SharedPreferenceKey key) =>
      _sharedPreferences!.remove(key.name);

  /// Clear is now will set the value of each keys to [Null] excluding
  /// the values from excluded keys.
  Future<void> clear([List<SharedPreferenceKey>? exclude]) async =>
      [...SharedPreferenceKey.values]
        ..removeWhere((element) => exclude!.contains(element))
        ..forEach(
          (element) {
            if (element != SharedPreferenceKey.keyAccessToken) {
              putString(element, '');
            }
          },
        );
}
