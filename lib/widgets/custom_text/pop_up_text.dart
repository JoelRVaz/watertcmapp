import 'package:flutter/material.dart';

class   PopUpText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  const   PopUpText({Key? key,
    required this.text,
    this.color = Colors.black,
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
