
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/navigation/main_router.gr.dart';
import 'package:watertcmapp/pop_ups/device_conection_popup/device_connection_popup.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';

class DeviceCard extends ConsumerWidget {
  final Device device;
  final bool bluetoothModeEnabled;
  const DeviceCard({Key? key, 
    this.bluetoothModeEnabled = false, 
    required this.device
  }) : super(key: key);

  void popPage(BuildContext context) {
    WidgetsBinding.instance
      .addPostFrameCallback((_) => context.popRoute());  
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: const Color.fromARGB(66, 22, 22, 22),
      child: InkWell(
        child: CustomText(text: device.serial, size: 17),
        onTap: () {
           ref.watch(deviceProvider.notifier).resetDevice();
           DeviceConnectionPopup(
             context: context,
             bluetoothModeEnabled: bluetoothModeEnabled, 
             serial: device.serial
          );
        },
      ),
    );
  }
}
