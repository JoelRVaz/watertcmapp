
import 'package:flutter/material.dart';
import 'package:watertcmapp/widgets/custom_icon.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;

  const CustomIconButton({Key? key, required this.onPressed, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, 
      icon: CustomIcon(icon: icon)
    );
  }
}
