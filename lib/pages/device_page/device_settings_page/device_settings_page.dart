import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/pages/device_page/device_app_page.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';


class DeviceSettingPage extends ConsumerWidget {
  const DeviceSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DeviceAppPage(
      title: 'settings',
      child: Center(
        child: CustomText(text:'Settings page')
      )
    );
  }
}