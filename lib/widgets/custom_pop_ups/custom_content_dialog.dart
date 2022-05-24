import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:watertcmapp/widgets/custom_text/pop_up_text.dart';

// ignore: non_constant_identifier_names
Future<void> ContentDialog({
  String title = '',
  Widget? content,
  List<Widget> actions = const <Widget>[],
  void Function()? onClose,
  required BuildContext context
  }) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: popUpColor,
        title: Row(children: [
          PopUpText(text: title),
          Expanded(child: 
            Stack(
              children: [
                Align(
                  alignment: const Alignment(1.05, -1.05),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      onClose?.call();
                    },
                    child: const Icon(Icons.close)
                  )
                ),
              ],
            )
          )
        ]),
        content: SingleChildScrollView(
          child: content
        ),
        actions: actions,
      );
    },
  );
}