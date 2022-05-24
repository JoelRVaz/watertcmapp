import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/providers/device/device_state_controller.dart';
import 'package:watertcmapp/providers/device/http/http_commands.dart';


class HttpDevice extends DeviceStateController{
  DeviceNotifier parentNotifier;
  HttpDevice(this.parentNotifier) : super(
    parentNotifier, 
    parentNotifier.networkMananger
  );
  
  HTTPdeviceCommands get commands => HTTPdeviceCommands(
    networkManager.httpClient
  );


  Future<Device> connect(String serial) async {
    Device device = await commands.getDevice(serial);
    state = state.update(
      selectedDevice: device,
      httpConnection: true
    );
    return device;
  }

  //called when device provider is disposed
  void onDispose() {
    commands.dispose();
  }

}
