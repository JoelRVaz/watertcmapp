import 'package:flutter/material.dart';
import 'package:watertcmapp/layout/bottom_nav_bar.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/services/platform_service.dart';

class SmallScreenLayout extends StatelessWidget {
  final Widget child;
  const SmallScreenLayout({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobileOs = locator<PlatformService>().isMobileOs();
    return Scaffold(
    
      backgroundColor: Colors.transparent,
      body: child,
      bottomNavigationBar: isMobileOs ? const BottomNavBar() : null
    );
  }
}
