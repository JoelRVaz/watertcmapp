import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:watertcmapp/layout/app_page.dart';

class AuthPages extends ConsumerWidget {
  const AuthPages({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPage(
      backgroundColor: primaryColor,
      showTopNav: false,
      child: Column(
        children:const [
          SizedBox(height: 60),
          Expanded(child: AutoRouter())
        ],
      ),
    );
  }
}