import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const _LOCAL_AUTH = "_LOCAL_AUTH";

  late SharedPreferences _preferences;

  /// [initialize] Launch an instance of SharedPreferences
  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// [enableLocalAuth] active local authentication on device
  /// This method should be called after the [initialize] method
  void enableLocalAuth() => _preferences.setBool(_LOCAL_AUTH, true);

  /// [disableLocalAuth] disable local authentication on device
  /// This method should be called after the [initialize] method
  void disableLocalAuth() => _preferences.remove(_LOCAL_AUTH);

  bool get isActiveLocalAuth => _preferences.getBool(_LOCAL_AUTH) ?? false;
}
