import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/layout/app_page.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/widgets/custom_icon.dart';

class DeviceAppPage extends ConsumerWidget {
  final String? title;
  final Widget child;
  final bool showCloseButton;
  final bool showBackButton;
  const DeviceAppPage({Key? key,
    this.title,
    required this.child,
    this.showCloseButton = false,
    this.showBackButton = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPage(
      title: title ?? '',
      child: child,
      showHamburger: false,
      customTopNavLeading : 
      (showCloseButton ? <Widget>[
        IconButton(
          onPressed: () { ref.watch(deviceProvider.notifier).
            resetDevice();
            context.router.navigateBack();
          },
          icon: const CustomIcon(icon: Icons.close)
        ),
      ] : <Widget>[]) +

      (showBackButton? [
        IconButton(
          onPressed: () =>context.navigateBack(), 
          icon: const CustomIcon(icon: Icons.arrow_back)
        )
      ] : <Widget>[]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.watch(deviceProvider.notifier).
        bluetoothDevice.commands.disconnect(),
      ),
    );
  }
}