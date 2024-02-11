import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});
  static int index = 0;
  int getind() {
    return index;
  }

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  // static int index = 0;

  @override
  Widget build(BuildContext context) {
    return GNav(
        // rippleColor: const Color.fromARGB(0, 77, 182, 172),
        // backgroundColor: const Color.fromARGB(0, 77, 182, 172),
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[700],
        selectedIndex: widget.getind(),
        activeColor: Colors.black,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: const Color.fromARGB(0, 0, 150, 135),
        onTabChange: (value) => widget.onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.event,
            text: 'Events',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ]);
  }
}
