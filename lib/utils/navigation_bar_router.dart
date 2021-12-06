import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/interface/favorite_page.dart';
import 'package:yum_health/interface/home_page.dart';

class NavigationBarRouter extends StatefulWidget {
  const NavigationBarRouter({Key? key}) : super(key: key);
  static const routeName = '/navigation_bar_router';

  @override
  State<NavigationBarRouter> createState() => _NavigationBarRouter();
}

class _NavigationBarRouter extends State<NavigationBarRouter> {
  final List<Widget> _pages = [
    FadeInLeft(child: const HomePage()),
    FadeInLeft(child: const BMIPage()),
    FadeInLeft(child: const FavoritePage()),
    FadeInLeft(child: const ProfilePage())
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: secondaryColor,
        ),
        child: BottomNavigationBar(
          unselectedItemColor: primaryColor,
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex, //New
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new),
              label: 'BMI',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
