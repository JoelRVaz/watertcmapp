import 'package:watertcmapp/models/device_model/device.dart';
import 'shared_commands.dart';

abstract class BluetoothCommands extends SharedCommands {
  Stream<List<Device>> getDevices();
}
