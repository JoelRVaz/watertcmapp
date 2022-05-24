import 'package:flutter/material.dart';
import 'package:watertcmapp/layout/app_page.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Settings',
      child: Center(
        child: CustomText(text: 'Settings page')
      ),    
    );
  }
}
