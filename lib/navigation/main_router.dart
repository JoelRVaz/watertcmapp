import 'package:auto_route/annotations.dart';
import 'package:watertcmapp/layout/layout.dart';
import 'package:watertcmapp/main/authenticated_pages.dart';
import 'package:watertcmapp/navigation/guards/auth_guard.dart';
import 'package:watertcmapp/navigation/guards/device_page_guard.dart';
import 'package:watertcmapp/pages/authentication/auth_pages.dart';
import 'package:watertcmapp/pages/authentication/authentication_page.dart';
import 'package:watertcmapp/pages/authentication/forgot_password_page.dart';
import 'package:watertcmapp/pages/authentication/registration_page.dart';
import 'package:watertcmapp/pages/clients_page/clients_page.dart';
import 'package:watertcmapp/pages/device_page/device_connection_page.dart';
import 'package:watertcmapp/pages/device_page/device_info_page/device_info_page.dart';
import 'package:watertcmapp/pages/device_page/device_pages.dart';
import 'package:watertcmapp/pages/device_page/device_settings_page/device_settings_page.dart';
import 'package:watertcmapp/pages/devices_page/devices_pages.dart';
import 'package:watertcmapp/pages/home_page/home_page.dart';
import 'package:watertcmapp/pages/settings_page/settings_page.dart';

// @CupertinoAutoRouter        
// @AdaptiveAutoRouter        
// @CustomAutoRouter        
@MaterialAutoRouter(        
  replaceInRouteName: 'Page,Route',        
  routes: <AutoRoute>[      
    AutoRoute(page: AuthPages, path: '/Auth', name: 'AuthPagesRoute', children: [
      AutoRoute(page: AuthenticationPage, path: '', name: 'AuthenticationPageRoute'),
      AutoRoute(page: RegistrationPage, path: 'Register', name: 'RegistrationPageRoute'),
      AutoRoute(page: ForgotPasswordPage, path: 'AccountRecovery', name: 'ForgotPasswordPageRoute'),
    ]),
    AutoRoute(page: AuthenticatedPages,guards: [AuthGuard] , initial: true, children: [
      AutoRoute(page: DevicePages, path: 'device/:serial', name: 'DevicePageRoute', children: [
        AutoRoute(page: DeviceInfoPage, path: '', name: 'DeviceInfoPageROute'),
        AutoRoute(page: DeviceSettingPage, path: 'device', name: 'DeviceSettingsPageROute')

      ]),
      AutoRoute(page: DeviceConnectionPage, path: 'connection', name: 'DeviceConnectionRoute'),
      AutoRoute(page: Layout, path: '', name: 'LayoutRoute', children: [
        AutoRoute(page: HomePage, path: '', name: 'HomePageRoute'),
        AutoRoute(page: DevicesPage, path: 'devices', name: 'DevicesPageRoute'),
        AutoRoute(page: SettingsPage, path: 'settings', name: 'SettingsPageRoute'),
        AutoRoute(page: ClientsPage, path: 'clients', name: 'ClientsPageRoute')
      ]),    
    ])
  ]      
)     



class $AppRouter {}  


