import 'package:flutter/material.dart';
import 'package:praktikum8_state_and_user_interactions/screens/animation_example.dart';
import 'package:praktikum8_state_and_user_interactions/screens/callback_example.dart';
import 'package:praktikum8_state_and_user_interactions/screens/counter_example.dart';
import 'package:praktikum8_state_and_user_interactions/screens/dynamic_list_example.dart';
import 'package:praktikum8_state_and_user_interactions/screens/user_input_example.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CounterExample(),
    UserInputExample(),
    CallbackExample(),
    AnimationExample(),
    DynamicListExample(),
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
            selectedIcon: Icon(Icons.add),
            icon: Icon(Icons.add_outlined),
            label: 'Counter',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'User Input',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.phone_callback),
            icon: Icon(Icons.phone_callback_outlined),
            label: 'Callback',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.animation),
            icon: Icon(Icons.animation_outlined),
            label: 'Animation',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.widgets),
            icon: Icon(Icons.widgets_outlined),
            label: 'List',
          ),
        ],
      ),
    );
  }
}
