import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/pages/devices_page/widgets/device_card.dart';
import 'package:watertcmapp/pages/devices_page/widgets/device_card_grid.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';

class ScanTab extends StatelessWidget {

  final AsyncValue<List<Device>> devices;
  final void Function(List<Device> data)? onData;
  final Widget Function(Object? error, StackTrace? stack)? onError;
  final Widget Function()? loading;
  final bool bluetoothModeEnabled;
  const ScanTab({ Key? key, 
    required this.devices, 
    this.onError,
    this.onData,
    this.loading,
    this.bluetoothModeEnabled = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: devices.when(
      data: (data) { 
        onData?.call(data);
        return CardGrid(deviceCards: data.map((device) =>
           DeviceCard(device: device, bluetoothModeEnabled: bluetoothModeEnabled),
          ).toList());
        },        
        error: (error, stack) => onError?.call(error, stack) ?? CustomText(text: error.toString()),
        loading:() {
          if (loading != null) {
            return loading!();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}