import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/pages/device_page/device_connection_page.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/providers/device/device_state.dart';


class DevicePageGuard extends AutoRedirectGuard {
  Reader read;
  DevicePageGuard(this.read);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation

    DeviceState device = read(deviceProvider);
    String serial = resolver.route.pathParams.getString('serial');

    if (serial == device.selectedDevice?.serial) {
      resolver.next();
    } else {

      router.pushWidget(
        DeviceConnectionPage(
          bluetoothModeEnabled: false,
          serial: serial, 
          onFinish: (success) {
            resolver.next(success);
          }
        )
      );

    }
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    return true;
  }
}
