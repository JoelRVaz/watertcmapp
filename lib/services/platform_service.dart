import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:watertcmapp/services/responsive_service.dart';

class PlatformService {
  bool isMobileOs() {
    return (
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android
    );
  }

  bool isDesktopOs() {
    return (
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.linux 
    );  
  }

  bool isWeb() {
    return kIsWeb;
  }

  bool isSmallWebScreen(BuildContext context) {
    return ResponsiveService(context).isSmallScreen() && isWeb();
  }

  bool isPhone(BuildContext context) {
    return ResponsiveService(context).isSmallScreen() && isMobileOs();
  }

  bool isTablet(BuildContext context) {
    ResponsiveService responsiveService = ResponsiveService(context);
    return responsiveService.isLargeSceen() || 
           responsiveService.isMediumScreen() && isMobileOs();
  }

}
