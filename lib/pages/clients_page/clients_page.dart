import 'package:flutter/material.dart';
import 'package:watertcmapp/layout/app_page.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Clients',
      customTopNavActions: [],
      child: Center(
        child: CustomText(text: 'Clients page')
      ),    
    );
  }
}
