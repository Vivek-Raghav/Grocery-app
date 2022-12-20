import 'package:flutter/material.dart';
import 'package:groceryapp/Provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Utils{
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvide>(context).getDarkTheme;
  Color get  color => getTheme ? Colors.white : Colors.black;
  Size get getscreenSize => MediaQuery.of(context).size;
}