import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BluetoothAuthGuard extends AutoRedirectGuard {
  Reader read;
  BluetoothAuthGuard(this.read);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    // ignore: invalid_use_of_protected_member

    resolver.next();
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    return true;
  }
}
