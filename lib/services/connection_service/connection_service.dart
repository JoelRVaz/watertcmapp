import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:watertcmapp/constants/enums/connection.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/providers/device/device_state.dart';
import 'package:watertcmapp/services/navigation_service/navigation_service.dart';

class ConnectionService {

  NavigationService navigationService = locator<NavigationService>();

  bool isInternet(ConnectivityResult connection) {
    return connection != ConnectivityResult.bluetooth &&
        connection != ConnectivityResult.none;
  }

  //is connected to the given connection type
  bool isConnectedToType(Connection? connection, DeviceState device) {
    return (device.bluetoothConnection &&
            (connection == Connection.bluetooth)) ||
        (device.httpConnection && (connection == Connection.http));
  }

  conectionParamsEncode({required String serial, required bool bluetoothModeEnabled, required String name}) {}


}
