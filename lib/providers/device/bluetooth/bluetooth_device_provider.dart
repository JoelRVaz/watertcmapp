
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/providers/device/bluetooth/bluetooth_commands.dart';
import 'package:watertcmapp/providers/device/device_state_controller.dart';



class BluetoothDevice extends DeviceStateController{
  DeviceNotifier parentNotifier;
  BluetoothDevice(this.parentNotifier) : super(
    parentNotifier, 
    parentNotifier.networkMananger
  );

  BluetoothDeviceCommands get commands => BluetoothDeviceCommands(
    networkManager.bluetoothClient
  );

  Future<Device> connect(String serial) async {
    Device device = await commands.connectToDevice(serial);
    state = state.update(
      selectedDevice: device,
      bluetoothConnection: true
    );
    return device;
  }

  Future<String> get({required String command}) async {
    return networkManager.bluetoothClient.get(
      state.selectedDevice!.macAddress, 
      command
    );
  }

  Future<String> getSerial() async {
    print("------");
    return await get(command: "#");
  }

  //called when device provider is disposed
  void onDispose() {
    commands.dispose();
  }
}
