import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  Future<bool> isDarkMode() async {
    // Read from SharedPreferences
    log('ThemeRepository.isDarkMode()');
    return await SharedPreferences.getInstance().then((prefs) {
      return prefs.getBool('isDarkMode') ?? false;
    });
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    // Save to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }
}
