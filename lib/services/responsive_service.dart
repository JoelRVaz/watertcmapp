
import 'dart:core';
import 'package:flutter/material.dart';

enum ScreenSize { smallScreen, mediumScreen, largeScreen }

class ResponsiveService {
  late BuildContext context;
  int smallScreenSize; //A smallScreen is smaller that or equal to the value of this variable
  int largeScreenSize; //A largescreen is greater that or equal to the value of this variable

  ResponsiveService(this.context,
      {this.smallScreenSize =
          1000, //Value should be 600 but is set to 1000 until medium screen layout is implemented
      this.largeScreenSize = 1000});

  double screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  double screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  bool isSmallScreen() {
    return screenWidth() <= smallScreenSize;
  }

  bool isMediumScreen() {
    return !isSmallScreen() && !isLargeSceen();
  }

  bool isLargeSceen() {
    return screenWidth() > largeScreenSize;
  }



  ScreenSize currentScreenSize() {
    if (isLargeSceen()) {
      return ScreenSize.largeScreen;
    } else if (isMediumScreen()) {
      return ScreenSize.mediumScreen;
    } else if (isLargeSceen()) {
      return ScreenSize.smallScreen;
    } else {
      return ScreenSize.smallScreen;
    }
  }

  Widget responsiveWidget(
      {required Widget smallScreen,
      mediumScreen,
      required Widget largeScreen}) {
    if (isSmallScreen()) {
      return smallScreen;
    } else if (isMediumScreen()) {
      return mediumScreen ??
          smallScreen; // if MediumSceen is null then default to small screen
    } else {
      return largeScreen;
    }
  }
}
