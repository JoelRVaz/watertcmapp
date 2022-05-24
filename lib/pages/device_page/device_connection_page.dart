import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:watertcmapp/widgets/device_connection_widget.dart';

class DeviceConnectionPage extends ConsumerWidget {
  final String serial;
  final void Function(bool success) onFinish;
  final bool bluetoothModeEnabled;
  const DeviceConnectionPage({
    Key? key,
    required this.serial,
    required this.onFinish,
    required this.bluetoothModeEnabled
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: primaryColor,
      child: DeviceConnectionWidget(
        onFinish: (device) {
          onFinish(true);
          context.router.pop();
          return Container();
        },
        bluetoothModeEnabled: bluetoothModeEnabled,
        serial: serial
      )
    );
  }
}
