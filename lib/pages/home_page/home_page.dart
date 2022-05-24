import 'package:flutter/material.dart';
import 'package:watertcmapp/layout/app_page.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';


class HomePage extends StatelessWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Home',
      child: Center(
        child: CustomText(text: 'Home page')
      ),
    );
  }
}