import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  const CustomBottomNavBar({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: [Icons.map, Icons.warning, Icons.settings],
      activeIndex: index,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: onTap,
      backgroundColor: Colors.blue,
      activeColor: Colors.white,
      inactiveColor: Colors.white60,
    );
  }
}
