import 'package:flutter/widgets.dart';
import 'package:groceryapp/services/dark_theme_preferences.dart';

class DarkThemeProvide extends ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
