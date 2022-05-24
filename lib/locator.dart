import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:watertcmapp/services/connection_service/connection_service.dart';
import 'package:watertcmapp/services/device_guard_service.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp/services/navigation_service/navigation_service.dart';
import 'package:watertcmapp/services/popup_service.dart';
import 'package:watertcmapp/services/platform_service.dart';
import 'package:watertcmapp/services/uuid_service.dart';

GetIt locator = GetIt.instance;

void setuplocator() {
  locator.registerSingleton<AuthNotifier>(AuthNotifier());
  locator.registerSingleton<DeviceGuardService>(DeviceGuardService()); 
  locator.registerSingleton<GlobalKey<AutoRouterState>>(GlobalKey<AutoRouterState>());

  locator.registerSingleton<PopUpService>(PopUpService(locator<GlobalKey<AutoRouterState>>()));
  locator.registerLazySingleton<PlatformService>(() => PlatformService());
  locator.registerLazySingleton<ConnectionService>(() => ConnectionService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerSingleton<GlobalKey<ScaffoldMessengerState>>(GlobalKey<ScaffoldMessengerState>());
  locator.registerSingleton<UuidService>(UuidService());
  locator.registerSingleton<GlobalKey<ScaffoldState>>(GlobalKey<ScaffoldState>());


}