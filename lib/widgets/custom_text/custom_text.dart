import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  const CustomText({Key? key,
    required this.text,
    this.color = Colors.white,
    this.size = 16,
    this.weight = FontWeight.normal
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight 
      )
    );  
  }
}