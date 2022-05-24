// ignore: non_constant_identifier_names
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:watertcmapp/widgets/custom_pop_ups/custom_content_dialog.dart';
import 'package:watertcmapp/widgets/future_widget.dart';

void loadingPopUp({
  required BuildContext context,
  required Future<String?> future,
  required Widget Function(String? data) onFinish,
  void Function(Object? error)? onError,

  String title = '',
}) {
  ContentDialog(
    context: context,
    title: title,
    content: FutureWidget<String?>(
      future: future, 
      onError: (error) => onError?.call(error as Object),
      data: (data) {
        context.popRoute();
        return onFinish(data);
      }
    )
  );
}