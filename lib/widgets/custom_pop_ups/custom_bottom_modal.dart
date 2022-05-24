import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:watertcmapp/widgets/custom_text/pop_up_text.dart';

// ignore: non_constant_identifier_names
Future<void> CustomBottomModal({
  String title = '',
  Widget? content,
  List<Widget> actions = const <Widget>[],
  void Function()? onClose,
  required BuildContext context
  }) async {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: popUpColor,
        child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: PopUpText(
                  text: title, 
                  size: 22
                )),
                IconButton(
                  onPressed: () { 
                    context.router.pop();
                    onClose?.call();
                  }, 
                  icon: const Icon(Icons.close)
                )
              ],
            ),
            Expanded(child: SingleChildScrollView(
              child: content,
            )),  
          ]
        )
      ));
    }
  );
}