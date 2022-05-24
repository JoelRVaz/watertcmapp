import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/navigation/main_router.gr.dart';
import 'package:watertcmapp/widgets/custom_text/pop_up_text.dart';
import 'package:watertcmapp/widgets/device_connection_widget.dart';

class DeviceConnectionContent extends ConsumerWidget {
  final String serial;
  final bool bluetoothModeEnabled;
  final String? name;
  final Function(bool success, Device device)? onFinish;
  const DeviceConnectionContent(
      {Key? key,
      required this.bluetoothModeEnabled,
      required this.serial,
      this.name,
      this.onFinish})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child:Column(
        children: [
          DeviceConnectionWidget(
            serial: serial,
            name: name,
            bluetoothModeEnabled: bluetoothModeEnabled,
            loading: () => Column(
              children: [
                PopUpText(
                  text: 'Connecting to ' + (name ?? serial),
                  size: 18,
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator()
              ],
            ),
            onFinish: (device) {
              context.router.push(DevicePageRoute(
                bluetoothModeEnabled: bluetoothModeEnabled,
                serial: serial,
                name: name,
                connected: true
              ));
              context.popRoute();
              onFinish?.call(true, device);
              return const PopUpText(text: 'Connected', size: 18);
            }
          ),
        ],
      ) 
    );
  }
}
