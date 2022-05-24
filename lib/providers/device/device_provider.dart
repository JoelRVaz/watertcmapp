import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/providers/device/bluetooth/bluetooth_device_provider.dart';
import 'package:watertcmapp/providers/device/device_state.dart';
import 'package:watertcmapp/providers/device/http/http_device_provider.dart';
import 'package:watertcmapp/services/connection_service/connection_service.dart';
import 'package:watertcmapp/services/network/network_manager/network_manager.dart';
import 'package:watertcmapp/services/network/network_manager/network_manager_state.dart';

// ignore: non_constant_identifier_names
final deviceProvider =
    StateNotifierProvider.autoDispose<DeviceNotifier, DeviceState>((ref) {
  final networkManager = ref.watch(networkManagerProvider);
  DeviceNotifier deviceNotifier =
      DeviceNotifier(networkMananger: networkManager, state: DeviceState());
  ref.onDispose(() => deviceNotifier.onDispose());
  return deviceNotifier;
});

class DeviceNotifier extends StateController<DeviceState> {
  NetworkManangerState networkMananger;
  DeviceNotifier({required DeviceState state, required this.networkMananger})
      : super(state) {
    state = state.update(httpConnection: networkMananger.httpConnection);
  }

  @override
  DeviceState get state => super.state;

  @override
  set state(DeviceState value) => super.state = value;

  HttpDevice get httpDevice => HttpDevice(this);
  BluetoothDevice get bluetoothDevice => BluetoothDevice(this);
  ConnectionService connectionService = locator<ConnectionService>();

  Future<Device> connect(
      {required String serial, bool bluetoothMode = false}) async {
    //tests if conncetion to aws can be established

    if (bluetoothMode) {
      Device device = await bluetoothDevice.connect(serial);
      return device;
    }

    bool isAwsAvailable = await httpDevice.commands.awsConnectionTest();
    print(bluetoothMode.toString() + serial);
    if (isAwsAvailable) {
      await httpDevice.connect(serial);
    }
    return Device();
  }

  void resetDevice() async {
    if (state.bluetoothConnection) {
      await bluetoothDevice.commands.disconnect();
    }
    state = DeviceState();
  }

  void onDispose() {
    httpDevice.onDispose();
    bluetoothDevice.onDispose();
  }

  void setCurrentDevicePagePath(String path) {
    state.currentDevicePagePath = path;
  }
}
