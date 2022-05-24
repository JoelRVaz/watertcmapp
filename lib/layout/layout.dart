import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:watertcmapp/layout/large_screen_size.dart';
import 'package:watertcmapp/layout/small_screen_layout.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/navigation/main_router.gr.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/services/network/network_manager/network_manager.dart';
import 'package:watertcmapp/services/responsive_service.dart';

class Layout extends ConsumerWidget {
  const Layout({Key? key}) : super(key: key);

  static final testering = GlobalKey<AutoRouterState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(networkManagerProvider);
    ref.watch(deviceProvider);
    return AutoTabsRouter(
        key: testering,
        lazyLoad: false,
        // list of your tab routes
        // routes used here must be declaraed as children
        // routes of /dashboard
        routes: const [
          HomePageRoute(),
          DevicesPageRoute(),
          ClientsPageRoute(),
          SettingsPageRoute(),
        ],
        builder: (context, child, animation) {
          // obtain the scoped TabsRouter controller using context
          // final tabsRouter = AutoTabsRouter.of(context);
          // Here we're building our Scaffold inside of AutoTabsRouter
          // to access the tabsRouter controller provided in this context
          //
          //alterntivly you could use a global key
          Widget childWidget(Widget child) {
            return FadeTransition(
              opacity: animation,
              // the passed child is techinaclly our animated selected-tab page
              child: child,
            );
          }

          return Scaffold(

              backgroundColor: primaryColor,
              body: ResponsiveService(context).responsiveWidget(
                  smallScreen: SmallScreenLayout(child: childWidget(child)),
                  largeScreen: LargeScreenLayout(child: childWidget(child))));
        });
  }
}
