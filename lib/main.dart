import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/login_radius/login_radius.dart';
import 'package:watertcmapp/navigation/guards/auth_guard.dart';
import 'package:watertcmapp/navigation/guards/device_page_guard.dart';
import 'navigation/main_router.gr.dart';

void main() {
  setuplocator();
  LoginRadius _loginRadius = LoginRadius.instance;
  _loginRadius.init(
    apiKey: "a2eeacac-f39e-4dc6-a192-e809ebe81e77",
    appName: "promagenviro-dijaxiro",
    sott:
        "leRoNBICptJKSyMTBFGA9DQTSRtevQA7oDL0zh8ZW61E3gLvw5Slc1LjblCCX5o5+6h5VWndzoCKgxcyLrATXu2C95Kyu3ZFIBVbZWhw1po=*dbfc906a46312764495795575c4842ff",
  );
  runApp(const ProviderScope(child: App()));
}



final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(
    authGuard: AuthGuard(),
   // devicePageGuard: DevicePageGuard(ref.read)
  );
});

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  // make sure you don't initiate your router
  // inside of the build function.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
    
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        // Provide an AutoRouteObserver instance   r
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      scaffoldMessengerKey: locator<GlobalKey<ScaffoldMessengerState>>(),
      
    );
  }
}
