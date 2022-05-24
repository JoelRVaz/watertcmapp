// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../layout/layout.dart' as _i8;
import '../main/authenticated_pages.dart' as _i2;
import '../pages/authentication/auth_pages.dart' as _i1;
import '../pages/authentication/authentication_page.dart' as _i3;
import '../pages/authentication/forgot_password_page.dart' as _i5;
import '../pages/authentication/registration_page.dart' as _i4;
import '../pages/clients_page/clients_page.dart' as _i14;
import '../pages/device_page/device_connection_page.dart' as _i7;
import '../pages/device_page/device_info_page/device_info_page.dart' as _i9;
import '../pages/device_page/device_pages.dart' as _i6;
import '../pages/device_page/device_settings_page/device_settings_page.dart'
    as _i10;
import '../pages/devices_page/devices_pages.dart' as _i12;
import '../pages/home_page/home_page.dart' as _i11;
import '../pages/settings_page/settings_page.dart' as _i13;
import 'guards/auth_guard.dart' as _i17;

class AppRouter extends _i15.RootStackRouter {
  AppRouter(
      {_i16.GlobalKey<_i16.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i17.AuthGuard authGuard;

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AuthPagesRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthPages());
    },
    AuthenticatedRoutes.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthenticatedPages());
    },
    AuthenticationPageRoute.name: (routeData) {
      final args = routeData.argsAs<AuthenticationPageRouteArgs>(
          orElse: () => const AuthenticationPageRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i3.AuthenticationPage(key: args.key, onResult: args.onResult));
    },
    RegistrationPageRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegistrationPage());
    },
    ForgotPasswordPageRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgotPasswordPage());
    },
    DevicePageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DevicePageRouteArgs>(
          orElse: () =>
              DevicePageRouteArgs(serial: pathParams.getString('serial', "")));
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.DevicePages(
              key: args.key,
              serial: args.serial,
              bluetoothModeEnabled: args.bluetoothModeEnabled,
              connected: args.connected,
              name: args.name));
    },
    DeviceConnectionRoute.name: (routeData) {
      final args = routeData.argsAs<DeviceConnectionRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.DeviceConnectionPage(
              key: args.key,
              serial: args.serial,
              onFinish: args.onFinish,
              bluetoothModeEnabled: args.bluetoothModeEnabled));
    },
    LayoutRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.Layout());
    },
    DeviceInfoPageROute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.DeviceInfoPage());
    },
    DeviceSettingsPageROute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.DeviceSettingPage());
    },
    HomePageRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.HomePage());
    },
    DevicesPageRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.DevicesPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SettingsPage());
    },
    ClientsPageRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ClientsPage());
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(AuthPagesRoute.name, path: '/Auth', children: [
          _i15.RouteConfig(AuthenticationPageRoute.name,
              path: '', parent: AuthPagesRoute.name),
          _i15.RouteConfig(RegistrationPageRoute.name,
              path: 'Register', parent: AuthPagesRoute.name),
          _i15.RouteConfig(ForgotPasswordPageRoute.name,
              path: 'AccountRecovery', parent: AuthPagesRoute.name)
        ]),
        _i15.RouteConfig(AuthenticatedRoutes.name, path: '/', guards: [
          authGuard
        ], children: [
          _i15.RouteConfig(DevicePageRoute.name,
              path: 'device/:serial',
              parent: AuthenticatedRoutes.name,
              children: [
                _i15.RouteConfig(DeviceInfoPageROute.name,
                    path: '', parent: DevicePageRoute.name),
                _i15.RouteConfig(DeviceSettingsPageROute.name,
                    path: 'device', parent: DevicePageRoute.name)
              ]),
          _i15.RouteConfig(DeviceConnectionRoute.name,
              path: 'connection', parent: AuthenticatedRoutes.name),
          _i15.RouteConfig(LayoutRoute.name,
              path: '',
              parent: AuthenticatedRoutes.name,
              children: [
                _i15.RouteConfig(HomePageRoute.name,
                    path: '', parent: LayoutRoute.name),
                _i15.RouteConfig(DevicesPageRoute.name,
                    path: 'devices', parent: LayoutRoute.name),
                _i15.RouteConfig(SettingsPageRoute.name,
                    path: 'settings', parent: LayoutRoute.name),
                _i15.RouteConfig(ClientsPageRoute.name,
                    path: 'clients', parent: LayoutRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.AuthPages]
class AuthPagesRoute extends _i15.PageRouteInfo<void> {
  const AuthPagesRoute({List<_i15.PageRouteInfo>? children})
      : super(AuthPagesRoute.name, path: '/Auth', initialChildren: children);

  static const String name = 'AuthPagesRoute';
}

/// generated route for
/// [_i2.AuthenticatedPages]
class AuthenticatedRoutes extends _i15.PageRouteInfo<void> {
  const AuthenticatedRoutes({List<_i15.PageRouteInfo>? children})
      : super(AuthenticatedRoutes.name, path: '/', initialChildren: children);

  static const String name = 'AuthenticatedRoutes';
}

/// generated route for
/// [_i3.AuthenticationPage]
class AuthenticationPageRoute
    extends _i15.PageRouteInfo<AuthenticationPageRouteArgs> {
  AuthenticationPageRoute({_i16.Key? key, dynamic Function(bool)? onResult})
      : super(AuthenticationPageRoute.name,
            path: '',
            args: AuthenticationPageRouteArgs(key: key, onResult: onResult));

  static const String name = 'AuthenticationPageRoute';
}

class AuthenticationPageRouteArgs {
  const AuthenticationPageRouteArgs({this.key, this.onResult});

  final _i16.Key? key;

  final dynamic Function(bool)? onResult;

  @override
  String toString() {
    return 'AuthenticationPageRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationPageRoute extends _i15.PageRouteInfo<void> {
  const RegistrationPageRoute()
      : super(RegistrationPageRoute.name, path: 'Register');

  static const String name = 'RegistrationPageRoute';
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordPageRoute extends _i15.PageRouteInfo<void> {
  const ForgotPasswordPageRoute()
      : super(ForgotPasswordPageRoute.name, path: 'AccountRecovery');

  static const String name = 'ForgotPasswordPageRoute';
}

/// generated route for
/// [_i6.DevicePages]
class DevicePageRoute extends _i15.PageRouteInfo<DevicePageRouteArgs> {
  DevicePageRoute(
      {_i16.Key? key,
      String serial = "",
      bool bluetoothModeEnabled = false,
      bool connected = false,
      String? name,
      List<_i15.PageRouteInfo>? children})
      : super(DevicePageRoute.name,
            path: 'device/:serial',
            args: DevicePageRouteArgs(
                key: key,
                serial: serial,
                bluetoothModeEnabled: bluetoothModeEnabled,
                connected: connected,
                name: name),
            rawPathParams: {'serial': serial},
            initialChildren: children);

  static const String name = 'DevicePageRoute';
}

class DevicePageRouteArgs {
  const DevicePageRouteArgs(
      {this.key,
      this.serial = "",
      this.bluetoothModeEnabled = false,
      this.connected = false,
      this.name});

  final _i16.Key? key;

  final String serial;

  final bool bluetoothModeEnabled;

  final bool connected;

  final String? name;

  @override
  String toString() {
    return 'DevicePageRouteArgs{key: $key, serial: $serial, bluetoothModeEnabled: $bluetoothModeEnabled, connected: $connected, name: $name}';
  }
}

/// generated route for
/// [_i7.DeviceConnectionPage]
class DeviceConnectionRoute
    extends _i15.PageRouteInfo<DeviceConnectionRouteArgs> {
  DeviceConnectionRoute(
      {_i16.Key? key,
      required String serial,
      required void Function(bool) onFinish,
      required bool bluetoothModeEnabled})
      : super(DeviceConnectionRoute.name,
            path: 'connection',
            args: DeviceConnectionRouteArgs(
                key: key,
                serial: serial,
                onFinish: onFinish,
                bluetoothModeEnabled: bluetoothModeEnabled));

  static const String name = 'DeviceConnectionRoute';
}

class DeviceConnectionRouteArgs {
  const DeviceConnectionRouteArgs(
      {this.key,
      required this.serial,
      required this.onFinish,
      required this.bluetoothModeEnabled});

  final _i16.Key? key;

  final String serial;

  final void Function(bool) onFinish;

  final bool bluetoothModeEnabled;

  @override
  String toString() {
    return 'DeviceConnectionRouteArgs{key: $key, serial: $serial, onFinish: $onFinish, bluetoothModeEnabled: $bluetoothModeEnabled}';
  }
}

/// generated route for
/// [_i8.Layout]
class LayoutRoute extends _i15.PageRouteInfo<void> {
  const LayoutRoute({List<_i15.PageRouteInfo>? children})
      : super(LayoutRoute.name, path: '', initialChildren: children);

  static const String name = 'LayoutRoute';
}

/// generated route for
/// [_i9.DeviceInfoPage]
class DeviceInfoPageROute extends _i15.PageRouteInfo<void> {
  const DeviceInfoPageROute() : super(DeviceInfoPageROute.name, path: '');

  static const String name = 'DeviceInfoPageROute';
}

/// generated route for
/// [_i10.DeviceSettingPage]
class DeviceSettingsPageROute extends _i15.PageRouteInfo<void> {
  const DeviceSettingsPageROute()
      : super(DeviceSettingsPageROute.name, path: 'device');

  static const String name = 'DeviceSettingsPageROute';
}

/// generated route for
/// [_i11.HomePage]
class HomePageRoute extends _i15.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i12.DevicesPage]
class DevicesPageRoute extends _i15.PageRouteInfo<void> {
  const DevicesPageRoute() : super(DevicesPageRoute.name, path: 'devices');

  static const String name = 'DevicesPageRoute';
}

/// generated route for
/// [_i13.SettingsPage]
class SettingsPageRoute extends _i15.PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: 'settings');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i14.ClientsPage]
class ClientsPageRoute extends _i15.PageRouteInfo<void> {
  const ClientsPageRoute() : super(ClientsPageRoute.name, path: 'clients');

  static const String name = 'ClientsPageRoute';
}
