import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  final String title;
  final void Function() onPressed;
  final Widget? child;
  const CustomButton({ Key? key, 
    this.title = "", 
    required this.onPressed ,
    this.child
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: double.maxFinite,
      height: 50,
      onPressed: onPressed,
      color: Colors.blue,
      child: child ?? Text(title,
        style: const TextStyle(color: Colors.white, fontSize: 16)),
        textColor: Colors.white,
      );
  }
}