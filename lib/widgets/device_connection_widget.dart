import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/widgets/async_widget.dart';

final connectionProvider = FutureProvider.autoDispose
    .family<Device, ConnectionInfo>((ref, connectionParams) async {
  print("connectiong to " + connectionParams.serial);
  final device = ref.watch(deviceProvider.notifier);
  print("---------");
  return device.connect(
      serial: connectionParams.serial,
      bluetoothMode: connectionParams.bluetoothModeEnabled);
});

class DeviceConnectionWidget extends ConsumerWidget {
  final String serial;
  final bool bluetoothModeEnabled;
  final String? name;
  final Widget Function(Device device) onFinish;
  final Widget Function(Object error, StackTrace? stack)? onError;
  final Widget Function()? loading;
  const DeviceConnectionWidget({
    Key? key,
    required this.onFinish,
    required this.bluetoothModeEnabled,
    required this.serial,
    this.name,
    this.loading,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceConnection =
        ref.watch(connectionProvider(ConnectionInfo(
          serial: serial,
          name: name,
          bluetoothModeEnabled: bluetoothModeEnabled
        )));
    return AsyncWidget<Device>(
      asyncValue: deviceConnection,
      onData: (device) => onFinish(device),
      onError: onError,
      loading: loading,
    );
  }
}

//TODO get rid of error
// ignore: must_be_immutable
class ConnectionInfo extends Equatable {
  final String serial;
  final bool bluetoothModeEnabled;
  String? name;

  ConnectionInfo(
      {required this.serial,
      this.bluetoothModeEnabled = false,
      this.name });

  @override
  String toString() {
    return 'Student: {Connection: $serial, serial: $bluetoothModeEnabled, name: $name}';
  }

  @override
  List<Object> get props => [serial, bluetoothModeEnabled];
}
