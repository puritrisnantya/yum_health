import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:yum_health/interface/favorite_page.dart';
import 'package:yum_health/interface/home_page.dart';

class NavigationBarRouter extends StatefulWidget {
  const NavigationBarRouter({Key? key}) : super(key: key);
  static const routeName = '/navigation_bar_router';

  @override
  State<NavigationBarRouter> createState() => _NavigationBarRouter();
}

class _NavigationBarRouter extends State<NavigationBarRouter> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Center(
      child: Text('Calculate'),
    ),
    FavoritePage(),
    Center(
      child: Text('Profile'),
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20.0, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color(0xFFD7FABF),
            color: Colors.black,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.calculator,
                text: 'Calculate',
              ),
              GButton(
                icon: LineIcons.heart,
                text: 'Favorite',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        )),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
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
