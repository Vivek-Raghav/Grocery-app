import 'package:flutter/material.dart';

class Styles {
  static ThemeData themedata(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkTheme
            ? const Color.fromARGB(255, 8, 8, 19)
            : const Color.fromARGB(255, 220, 220, 230),
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme
                ? const Color.fromARGB(255, 8, 8, 19)
                : const Color.fromARGB(255, 220, 220, 230),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light),
        cardColor: isDarkTheme
            ? const Color.fromARGB(255, 8, 8, 19)
            : const Color.fromARGB(255, 220, 220, 230),
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()));
  }
}
