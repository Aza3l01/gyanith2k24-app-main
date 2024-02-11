import 'package:flutter/material.dart';
import 'package:gyanith2k24/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode!;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode!;
    }
  }
}
