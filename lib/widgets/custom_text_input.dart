import 'package:flutter/material.dart';
import 'package:watertcmapp/constants/colors.dart';


class CustomTextInput extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final bool autoCorrect;
  final bool enableSuggestions;

  const CustomTextInput({
    Key? key,
    this.icon,
    this.hintText = "",
    this.obscureText = false,
    this.autoCorrect = true,
    this.enableSuggestions = true,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autoCorrect,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: secondaryColor,
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(0)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.white),
          )
        ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:watertcmappf/Constants/Colors.dart';
import 'package:watertcmappf/Widgets/CustomIcon.dart';

class CustomTextInput extends StatelessWidget {
  final IconData? icon;
  final String labelText;

  const CustomTextInput({Key? key,
    this.icon = null,
    this.labelText = "",

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: SecondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          icon: CustomIcon(icon: icon),
            // prefix: Icon(icon),
          border: InputBorder.none
        ),
      ),
    );
  }
}
*/