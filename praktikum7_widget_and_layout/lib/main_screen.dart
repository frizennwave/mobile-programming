import 'package:flutter/material.dart';
import 'package:praktikum7_widget_and_layout/screens/articles_screen.dart';
import 'package:praktikum7_widget_and_layout/screens/home_screen.dart';
import 'package:praktikum7_widget_and_layout/screens/login_screen.dart';
import 'package:praktikum7_widget_and_layout/screens/widget_bertingkat_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ArticlesScreen(),
    WidgetBertingkatScreen(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.article),
            icon: Icon(Icons.article_outlined),
            label: 'Articles',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.widgets),
            icon: Icon(Icons.widgets_outlined),
            label: 'Widgets',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.login),
            icon: Icon(Icons.login_outlined),
            label: 'Login',
          ),
        ],
      ),
    );
  }
}
