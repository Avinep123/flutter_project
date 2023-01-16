import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
    ),
    child: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart_fill), label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bag), label: 'Offers'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      showUnselectedLabels: true,
    ),
  );
}
    
}
