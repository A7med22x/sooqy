import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setOnboardingViewed(bool value) async {
    await _prefs?.setBool('onboarding_viewed', value);
  }

  static bool get onboardingViewed =>
      _prefs?.getBool('onboarding_viewed') ?? false;
}