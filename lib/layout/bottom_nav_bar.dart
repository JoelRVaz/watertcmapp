import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:auto_route/auto_route.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  int _currentScreen = 1;



  @override
  Widget build(BuildContext context) {


    void _onItemTapped(int index) {
      setState(() {
        _currentScreen = index;
      });
      switch (index) {
        case 0:
          context.router.navigateNamed('/devices');
          break;
        case 1:
          context.router.navigateNamed('/');
          break;
        case 2:
          context.router.navigateNamed('/settings');
          break;
        default:
      }
    }

    return BottomNavigationBar(
      backgroundColor: secondaryColor,
      selectedItemColor: white,
      unselectedItemColor: unActive,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.developer_board),
          label: 'Devices',
          backgroundColor: secondaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: secondaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: secondaryColor,
        ),
      ],
      currentIndex: _currentScreen,
      onTap: _onItemTapped,
    );
  }
}