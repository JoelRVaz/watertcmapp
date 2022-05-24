import 'package:watertcmapp/constants/navigation/routes.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/providers/device/bluetooth/bluetooth_device_provider.dart';

class DeviceState {
  Device? selectedDevice;
  bool httpConnection;
  bool bluetoothConnection;
  String? get deviceSerial => selectedDevice?.serial;
  String? get deviceMacAdress => selectedDevice?.macAddress;
  String? get deviceName => selectedDevice?.name;
  bool get bluetoothModeEnabled => bluetoothConnection;
  //Checks to see if there is a selected device in the device provider
  bool get isThereASelectedDevice => selectedDevice != null;

  String currentDevicePagePath;

  DeviceState({
    this.selectedDevice,
    this.httpConnection = false,
    this.bluetoothConnection = false,
    this.currentDevicePagePath = scanningPagePath,
  });

  DeviceState update(
      {Device? selectedDevice,
      bool? httpConnection,
      bool? bluetoothConnection,
      String? currentDevicePagePath,
      BluetoothDevice? bluetoothDevice}) {
    return DeviceState(
      selectedDevice: selectedDevice ?? this.selectedDevice,
      httpConnection: httpConnection ?? this.httpConnection,
      bluetoothConnection: bluetoothConnection ?? this.bluetoothConnection
    );
  }
}
