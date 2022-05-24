import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/pages/devices_page/providers/refresher.dart';
import 'package:watertcmapp/pages/devices_page/scan_tab/scan_tab.dart';

final bluetoothScanProvider = StreamProvider.autoDispose<List<Device>>((ref) {
  final device = ref.watch(scanProvider);
  return device.bluetoothDevice.commands.getDevices();
});

class BluetoothScanTab extends ConsumerWidget {
  const BluetoothScanTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(bluetoothScanProvider);
    return ScanTab(
      devices: devices,
      bluetoothModeEnabled: true,
    );
  }
}
