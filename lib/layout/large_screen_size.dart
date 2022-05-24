import 'package:flutter/material.dart';
import 'package:watertcmapp/layout/side_bar/side_bar.dart';

class LargeScreenLayout extends StatelessWidget {
  final Widget child;
  const LargeScreenLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          const Expanded(
            child: SideBar(isDisplayed: true),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: child,
            ),
          )
        ],
      )
    );
  }
}
