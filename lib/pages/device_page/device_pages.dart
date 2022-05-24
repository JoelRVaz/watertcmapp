import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:watertcmapp/navigation/main_router.gr.dart';
import 'package:watertcmapp/pages/device_page/device_connection_page.dart';
import 'package:watertcmapp/pop_ups/device_conection_popup/device_connection_popup.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';
import 'package:watertcmapp/widgets/device_connection_widget.dart';

class DevicePages extends ConsumerStatefulWidget {
  final String serial;
  final bool bluetoothModeEnabled;
  final bool connected;
  final String? name;
  const DevicePages(
      {Key? key,
      @PathParam('serial') this.serial = "",
      this.bluetoothModeEnabled = false,
      this.connected = false,
      this.name})
      : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DevicePagesState();
}

class _DevicePagesState extends ConsumerState<DevicePages> {
  bool connected = false;

  @override
  void initState() {
    setState(() {
      connected = widget.connected;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final device = ref.watch(deviceProvider);
      if (widget.serial != device.selectedDevice?.serial) {
        context.router.pushWidget(DeviceConnectionPage(
          bluetoothModeEnabled: widget.bluetoothModeEnabled,
          serial: widget.serial,
          onFinish: (success) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {
                connected = true;
              });
            });
          }
        ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: connected ? const AutoRouter() : Container(color: primaryColor),
    );
  }
}
