import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:watertcmapp/services/responsive_service.dart';
import 'package:watertcmapp/widgets/alert_widgets/custom_alert_dialog.dart';
import 'package:watertcmapp/widgets/custom_pop_ups/custom_bottom_modal.dart';
import 'package:watertcmapp/widgets/custom_pop_ups/custom_content_dialog.dart';

class PopUpService {

  GlobalKey<AutoRouterState> autoRouterKey;
  PopUpService(this.autoRouterKey);

  Future<void> responsivePopup({
    BuildContext? context,
    String title = '',
    Widget? content,
    void Function()? onClose
  }) async {
    context = context ?? autoRouterKey.currentContext!;
    return ResponsiveService(context).isSmallScreen()
      ? customBottomModal(
        context: context, 
        title: title, 
        content: content,
        onClose: onClose
      )
      : contentDialog(
        context: context, 
        title: title, 
        content: content,
        onClose: onClose
      );
  }

  Future<void> customBottomModal({
    String title = '',
    Widget? content,
    List<Widget> actions = const <Widget>[],
    BuildContext? context,
    void Function()? onClose
  }) {
    context = context ?? autoRouterKey.currentContext!;
    return CustomBottomModal(
      context: context,
      content: content,
      actions: actions,
      title: title,
      onClose: onClose
    );
  }


  Future<void> contentDialog({
    String title = '',
    Widget? content,
    List<Widget> actions = const <Widget>[],
    BuildContext? context,
    void Function()? onClose
  }) {
    context = context ?? autoRouterKey.currentContext!;
    return ContentDialog(
      context: context,
      content: content,
      actions: actions,
      onClose: onClose,
      title: title
    );
  }

  void customAlertDialog({  
    String title = '',
    String body = '',
    List<Widget> actions = const <Widget>[],
    BuildContext? context,
    void Function()? onClose
  }) {
    context = autoRouterKey.currentContext!;
    print(context);
    return CustomAlertDialog(
      context: context,
      title: title,
      actions: actions,
      onClose: onClose,
      body: body
    );
  }

}
