import 'package:flutter/material.dart';
import 'package:workout_app/screens/home.dart';
import 'package:workout_app/screens/profile.dart';
import 'package:workout_app/screens/trainings.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) => setState(() => _selectedPageIndex = index);

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen();
    String activePageTitle = 'Home';

    if (_selectedPageIndex == 1) {
      activePage = const TrainingsScreen();
      activePageTitle = 'Your trainings';
    } else if (_selectedPageIndex == 2) {
      activePage = ProfileScreen();
      activePageTitle = 'Your profile';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
