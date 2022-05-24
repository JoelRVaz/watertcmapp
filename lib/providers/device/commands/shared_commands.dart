import 'package:watertcmapp/models/device_model/device.dart';

abstract class SharedCommands {
  Future<Device> getDevice(String serial);
}