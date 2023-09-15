import 'package:design/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'components/bottom_navigation_floting.dart';
import 'components/drawer_navigation.dart';
import 'components/custom_appbar.dart';
import 'splash/splash_screen.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({super.key});

  @override
  State<ScreenNavigator> createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> currentScreen = [
      const Home(),
      const SplashScreen(),
    ];

    return Scaffold(
      drawer: const DrawerNavigation(),
      appBar: CustomAppBar().customAppBar(),
      body: currentScreen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            tooltip: 'Home',
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          )
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: const FlotingBottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}