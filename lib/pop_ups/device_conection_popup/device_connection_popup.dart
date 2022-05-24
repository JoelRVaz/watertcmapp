import 'package:flutter/material.dart';
import 'package:watertcmapp/constants/enums/connection.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/pop_ups/device_conection_popup/device_connection_content.dart';
import 'package:watertcmapp/services/popup_service.dart';


// ignore: non_constant_identifier_names
Future<void> DeviceConnectionPopup({
  required BuildContext context,
  required bluetoothModeEnabled,
  required serial,
  final void Function()? onClose,
  String? name,
  Function(bool success, Device device)? onFinish,
  Connection? connection,

}) async {
  return locator<PopUpService>().responsivePopup(
    title: '',
    context: context,
    content: DeviceConnectionContent(
      serial: serial,
      name: name,
      bluetoothModeEnabled: bluetoothModeEnabled,
      onFinish: onFinish,
    ),
  );
}
