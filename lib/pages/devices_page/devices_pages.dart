import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/layout/app_page.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/pages/devices_page/bluetooth_scan_tab.dart';
import 'package:watertcmapp/pages/devices_page/http_scan_tab.dart';
import 'package:watertcmapp/pages/devices_page/providers/refresher.dart';
import 'package:watertcmapp/pop_ups/register_device_popup/register_device_popup.dart';
import 'package:watertcmapp/services/platform_service.dart';
import 'package:watertcmapp/widgets/custom_icon.dart';
import 'package:watertcmapp/widgets/custom_icon_button.dart';

class DevicesPage extends ConsumerStatefulWidget {
  const DevicesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends ConsumerState<DevicesPage>
  with SingleTickerProviderStateMixin {

  late TabController tabController;


  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabIcons.length);
  }



  bool isWeb = locator<PlatformService>().isWeb();

  List<Widget> tabIcons = locator<PlatformService>().isWeb()
      ? [const Tab(icon: Icon(Icons.public))]
      : [
          const Tab(icon: Icon(Icons.public)),
          const Tab(icon: Icon(Icons.bluetooth))
        ];

  @override
  Widget build(BuildContext context) {
    final refresh = ref.watch(refresherProvider);
    final refreshNotifier = ref.watch(refresherProvider.notifier);
    List<Widget> tabContent = isWeb
        ? [const HttpScanTab()]
        : [const HttpScanTab(), const BluetoothScanTab()];

    return AppPage(
        title: 'Devices',
        customTopNavActions: [
          refresh
              ? CustomIconButton(
                  onPressed: () {
                    refreshNotifier.refreshScan();
                  },
                  icon: Icons.refresh)
              : const CustomIcon(icon: Icons.restart_alt, color: Colors.grey),
          CustomIconButton(
              onPressed: () => RegisterDevicePopup(
                  context: context,
                  onFinish: (success, serial) => success
                      ? refreshNotifier.refreshScan()
                      : print("failed")),
              icon: Icons.add)
        ],
        child: DefaultTabController(
            length: tabIcons.length,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: isWeb
                  ? null
                  : TabBar(
                      tabs: tabIcons,
                      controller: tabController,
                    ),
              body: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                      child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: tabContent,
                    controller: tabController,
                  ))
                ],
              ),
            )));
  }
}
