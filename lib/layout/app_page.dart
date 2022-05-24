import 'package:flutter/material.dart';
import 'package:watertcmapp/layout/side_bar/side_bar.dart';
import 'package:watertcmapp/layout/top_nav.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/services/platform_service.dart';

class AppPage extends StatelessWidget {
  final Widget child;
  final Widget? topNav;
  final String title;
  final bool? showHamburger;
  final Widget? floatingActionButton;
  final bool showTopNav;
  final List<Widget> customTopNavActions;
  final Color? backgroundColor;
  final List<Widget> customTopNavLeading;
  const AppPage({Key? key,
    required this.child,
    this.topNav,
    this.showHamburger,
    this.floatingActionButton,
    this.title = '',
    this.customTopNavActions = const [],
    this.showTopNav = true,
    this.backgroundColor,
    this.customTopNavLeading = const []
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.transparent,
      appBar: showTopNav ? PreferredSize(
        child: TopNav(
          title: title,
          showHamburger: showHamburger ?? 
            locator<PlatformService>().isSmallWebScreen(context),
          customTopNavLeading: customTopNavLeading,
          customTopNavActions: customTopNavActions
        ),
      preferredSize: const Size.fromHeight(60)) : null,
      body: child,
      drawer: const SideBar(),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: floatingActionButton,
    );
  }
}
