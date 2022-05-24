import 'package:watertcmapp/providers/device/commands/shared_commands.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/models/user_model/user.dart';


abstract class HTTPcommands extends SharedCommands {
  Future<User?> getUser();
  Future<List<Device>> getDevices();
  Future<Device> registerDevice(String serial);
}