import 'dart:async';
import 'dart:convert';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:watertcmapp/constants/tests/backend.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/services/network/bluetooth_client.dart';
import 'package:watertcmapp/utilities/stream_utitlity.dart';

class BluetoothDeviceCommands {
  List<Device> scannedDevices = [];
  final flutterReactiveBle = FlutterReactiveBle();
  BluetoothClient bluetoothClient;

  BluetoothDeviceCommands(
    this.bluetoothClient,
  );

  Future<Device> getDevice(String serial) async {
    var device = jsonDecode(singleDevice);
    return Device.fromJson(device);
  }

  Future<Device> connectToDevice(String deviceId) async {
    print("connecting via bluetooth to" + deviceId);
    ConnectionStateUpdate connection =
        await bluetoothClient.connectToDevice(deviceId);
    return Device(serial: connection.deviceId, macAddress: connection.deviceId);
  }

  StreamUtil devicesStream =
      StreamUtil(StreamController<List<Device>>.broadcast());

  Stream<List<Device>> getDevices() {
    return bluetoothClient.getDevices();
  }

  Future<bool> disconnect() async {
    return await bluetoothClient.disconnectDevice();
  }


  void dispose() {
    devicesStream.dispose();
  }
}
