import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/navigation/main_router.gr.dart';
import 'package:watertcmapp/pages/device_page/device_app_page.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';


// final serialProvider = FutureProvider.autoDispose<String>((ref) async {
//   final device = ref.watch(deviceProvider.notifier);
//   return device.bluetoothDevice.getSerial();
// });

class DeviceInfoPage extends ConsumerStatefulWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends ConsumerState<DeviceInfoPage> {


  @override
  Widget build(BuildContext context) {
    final device = ref.watch(deviceProvider);
    return DeviceAppPage(
      showCloseButton: true,
      showBackButton: false,
      title: device.selectedDevice?.serial ?? '',
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              context.router.navigate(DeviceSettingsPageROute());
            }, 
            child: const CustomText(text: 'text')
          ),

        ],
      )
    );
  }
}