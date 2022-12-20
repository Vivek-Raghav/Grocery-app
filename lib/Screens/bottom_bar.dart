import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/Provider/dark_theme_provider.dart';
import 'package:groceryapp/Screens/Home_screen.dart';
import 'package:groceryapp/Screens/cart_screen.dart';
import 'package:groceryapp/Screens/categories_screen.dart';
import 'package:groceryapp/Screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {"Page": const Homescreen(), "title": "HomeScreen"},
    {"Page": CategoriesScreen(), "title": "CategroriesScreen"},
    {"Page": const CartScreen(), "title": "Cart Screen"},
    {"Page": const UserScreen(), "title": "User Screen"}
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvide>(context);
    bool isDarkTheme = themeState.getDarkTheme;
    return Scaffold( 
      body: _pages[_selectedIndex]["Page"],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor:
              isDarkTheme ? Theme.of(context).cardColor : Colors.white,
          currentIndex: _selectedIndex,
          onTap: _selectedPage,
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category),
                label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy,),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
                label: "User"),
          ]),
    );
  }
}
