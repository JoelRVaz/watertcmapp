import 'package:flutter/material.dart';
import 'package:watertcmapp/layout/app_page.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';


class Tester extends StatelessWidget {
  const Tester({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      child: Center(child: CustomText(text: 'test page')),
    );
  }
}