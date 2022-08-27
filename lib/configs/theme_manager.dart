import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icab/configs/storage_manager.dart';
import 'package:icab/configs/theme.dart';

class ThemeNotifier with ChangeNotifier {
  static const _lightKey = 'light';
  static const _darkKey = 'dark';

  final darkTheme = AppTheme.dark();

  final lightTheme = AppTheme.light();

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      if (kDebugMode) print('value read from storage: $value');
      var themeMode = value ?? _lightKey;
      if (themeMode == _lightKey) {
        _themeData = lightTheme;
      } else {
        if (kDebugMode) print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', _darkKey);
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', _lightKey);
    notifyListeners();
  }

  void switchThemeMode() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
    } else {
      _themeData = lightTheme;
    }
    notifyListeners();
  }
}
