import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData? icon;
  final Color color;
  const CustomIcon({Key? key,
    this.icon,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color);
  }
}
