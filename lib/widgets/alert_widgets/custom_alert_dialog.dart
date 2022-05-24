
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

// ignore: non_constant_identifier_names
void CustomAlertDialog({
  String title = '',
  String body = '',
  List<Widget> actions = const <Widget>[],
  required BuildContext context,
  void Function()? onClose,
  }) {
  Timer.run(() {
    showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            PlatformDialogAction(
              child: PlatformText('Okay'),
              onPressed: () {
                context.router.popTop();
                onClose?.call();
              },
            )
          ] +
        actions,
      )
    );
  });
}
