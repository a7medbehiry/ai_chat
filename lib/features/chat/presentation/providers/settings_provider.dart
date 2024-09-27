import 'package:flutter/material.dart';

import '../../data/hive/boxes.dart';
import '../../data/hive/settings.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void getSavedSettings() {
    final settingsBox = Boxes.getSettings();

    if (settingsBox.isNotEmpty) {
      final settings = settingsBox.getAt(0);
      _isDarkMode = settings!.isDarkTheme;
    }
  }

  void toggleDarkMode({
    required bool value,
    Settings? settings,
  }) {
    if (settings != null) {
      settings.isDarkTheme = value;
      settings.save();
    } else {
      final settingsBox = Boxes.getSettings();
      settingsBox.put(
          0,
          Settings(
            isDarkTheme: value,
          ));
    }

    _isDarkMode = value;
    notifyListeners();
  }
}
