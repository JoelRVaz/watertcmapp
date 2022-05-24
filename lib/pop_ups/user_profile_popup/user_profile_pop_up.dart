import 'package:flutter/material.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/pop_ups/user_profile_popup/user_profile_content.dart';
import 'package:watertcmapp/services/popup_service.dart';

// ignore: non_constant_identifier_names
Future<void> UserProfilePopup(BuildContext context) async {

  return locator<PopUpService>().responsivePopup(
    title: 'User profile',
    context: context,
    content: const UserProfliePopUpContent()
  );
}

