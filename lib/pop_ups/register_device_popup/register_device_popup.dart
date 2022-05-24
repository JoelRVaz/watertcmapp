import 'package:flutter/material.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/pop_ups/register_device_popup/register_device_form.dart';
import 'package:watertcmapp/services/popup_service.dart';


// ignore: non_constant_identifier_names
Future<void> RegisterDevicePopup({
  required BuildContext context,
  Function(bool success, String device)? onFinish
}) async {
  return locator<PopUpService>().responsivePopup(
    title: 'Register device',
    context: context,
    content: RegisterDeviceForm(onFinish: onFinish),
  );
}

