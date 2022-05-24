import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/services/uuid_service.dart';

class BluetoothClient {
  FlutterReactiveBle flutterReactiveBle = FlutterReactiveBle();
  List<String> bluetoothAcessTokens;
  BluetoothClient({required this.bluetoothAcessTokens});

  StreamController<ConnectionStateUpdate> connectionController =
      StreamController.broadcast();

  StreamSubscription<ConnectionStateUpdate>? connection;

  Future<ConnectionStateUpdate> connectToDevice(String deviceId) async {
    disconnectDevice();
    connection = flutterReactiveBle
        .connectToDevice(
      id: deviceId,
      // connectionTimeout: const Duration(seconds: 10),
    )
        .listen((connectionState) {
      print(connectionState);
      connectionController.sink.add(connectionState);
    }, onError: (Object error) {
      // Handle a possible error
    });

    return await connectionController.stream.firstWhere((element) {
      if (element.connectionState == DeviceConnectionState.connected) {
        reader(deviceId);
      }
      return element.connectionState == DeviceConnectionState.connected;
    });
  }

  Future<bool> disconnectDevice() async {
    print(connection?.isPaused);
    await connection?.cancel();
    return true;
  }

  StreamController<List<Device>> scanController = StreamController.broadcast();

  Stream<List<Device>> getDevices() {
    Set<Device> devices = {};
    print("object");
    flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).listen((device) {
      //code for handling results
      devices.add(
          Device(macAddress: device.id, serial: device.id, name: device.name));
      scanController.sink.add(devices.toList());
    }, onError: (Object error) {
      throw error;
      //code for handling error
    });
    return scanController.stream;
  }

  StreamSubscription? recieverStream;
  StreamController<String> recieverController = StreamController.broadcast();

  void reader(String deviceId) {
    print("------===-----");
    String message = '';
    final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse('6E400001-B5A3-F393-E0A9-E50E24DCCA9E'),
        characteristicId: Uuid.parse('6E400003-B5A3-F393-E0A9-E50E24DCCA9E'),
        deviceId: deviceId);
    recieverStream?.cancel();
    recieverStream = flutterReactiveBle
        .subscribeToCharacteristic(characteristic)
        .listen((data) {
      String dataString = String.fromCharCodes(data);
      print(dataString);
      if (!dataString.contains("\\EOF")) {
        message = message + dataString;
      } else {
        recieverController.sink.add(message + dataString);
        print(message + dataString + "----");
        message = '';
      }
      // code to handle incoming data
    }, onError: (dynamic error) {
      // code to handle errors
    });
  }

  Future<String> get(String deviceId, String command) async {
    String uuid = locator<UuidService>().hello();
    Future.delayed(const Duration(milliseconds: 500), () {
      sendMessage(deviceId, command, uuid);
    });
    return await recieverController.stream.firstWhere((message) {
      return message.contains(uuid);
    });
  }

  List<int> encode(String string) {
    return string.codeUnits;
  }

  void sendMessage(String deviceId, String command, String uuid) async {
    List<int> message = encode("""{
    "type": "command",
    "command": "$command",
    "uuid": "$uuid"
    }""");
    try {
      final characteristic = QualifiedCharacteristic(
          serviceId: Uuid.parse('6E400001-B5A3-F393-E0A9-E50E24DCCA9E'),
          characteristicId: Uuid.parse('6E400002-B5A3-F393-E0A9-E50E24DCCA9E'),
          deviceId: deviceId);
      await flutterReactiveBle
          .writeCharacteristicWithoutResponse(characteristic, value: message);
    } catch (e) {
      rethrow;
    }
  }
}
