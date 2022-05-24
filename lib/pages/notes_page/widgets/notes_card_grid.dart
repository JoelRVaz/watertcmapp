import 'package:flutter/material.dart';
import 'package:watertcmapp/pages/devices_page/widgets/device_card.dart';
import 'package:watertcmapp/services/responsive_service.dart';


class CardGrid extends StatelessWidget {
  final List<DeviceCard> deviceCards;
  const CardGrid({Key? key, required this.deviceCards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponsiveService screen = ResponsiveService(context);
    return (deviceCards.isEmpty) ? Container() : GridView.count(
      crossAxisCount: (screen.screenWidth() / 300).ceil(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.only(left: 15, right: 15),
      children: deviceCards,
    );
  }
}