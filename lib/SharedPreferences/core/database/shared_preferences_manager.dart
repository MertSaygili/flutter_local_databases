import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { count }

class SharedManager {
  SharedPreferences? _preferences;

  // constructor
  SharedManager() {
    init();
  }

  // initiliaze
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // returns string value
  Future<String> getString(SharedKeys key) async {
    _checkPreferences();
    return _preferences?.getString(key.name) ?? '';
  }

  // returns integer value
  Future<int> getInt(SharedKeys key) async {
    _checkPreferences();
    return _preferences?.getInt(key.name) ?? 0;
    // i put 0 as an default error value
  }

  // returns double value
  Future<double> getDouble(SharedKeys key) async {
    _checkPreferences();
    return _preferences?.getDouble(key.name) ?? -9999;
  }

  // returns boolean value
  Future<bool> getBoolean(SharedKeys key) async {
    _checkPreferences();
    return _preferences?.getBool(key.name) ?? false;
    // default value is false
  }

  // returns string list
  Future<List<String>> getStringList(SharedKeys key) async {
    _checkPreferences();
    return _preferences?.getStringList(key.name) ?? [];
    // empty list as an default value
  }

  // saves string value
  Future<void> setString(String value, SharedKeys key) async {
    _checkPreferences();
    await _preferences?.setString(key.name, value);
  }

  // saves integer value
  Future<void> setInt(int value, SharedKeys key) async {
    _checkPreferences();
    await _preferences?.setInt(key.name, value);
  }

  // saves double value
  Future<void> setDouble(double value, SharedKeys key) async {
    _checkPreferences();
    await _preferences?.setDouble(key.name, value);
  }

  // saves string list
  Future<void> setStringList(List<String> value, SharedKeys key) async {
    _checkPreferences();
    await _preferences?.setStringList(key.name, value);
  }

  // clears all values
  Future<bool> clearValues() async {
    _checkPreferences();
    return await _preferences?.clear() ?? false;

    // if returns true -> cleared all values,
    // if returns false -> something gone wrong
  }

  // reloads all values
  void reload() {
    _checkPreferences();
    _preferences?.reload();
  }

  // remove key's value
  void removeKey(SharedKeys key) {
    _checkPreferences();
    _preferences?.remove(key.name);
  }

  void _checkPreferences() {
    if (_preferences == null) throw 'Preferences Error';
  }
}
