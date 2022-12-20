import 'package:flutter/material.dart';
import 'package:groceryapp/Provider/dark_theme_provider.dart';
import 'package:groceryapp/Screens/bottom_bar.dart';
import 'package:groceryapp/consts/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Here we are changing the state of a screen by switching the theme when user tap on dark theme or light theme
  DarkThemeProvide themeChangeProvider = DarkThemeProvide();

  void getCurrentTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool _isdark = true;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvide>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themedata(themeProvider.getDarkTheme, context),
            home: const BottomBarScreen());
      }),
    );
  }
}
