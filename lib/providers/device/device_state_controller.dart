
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/providers/device/device_state.dart';
import 'package:watertcmapp/services/network/network_manager/network_manager_state.dart';
import 'package:watertcmapp/utilities/parent_state.dart';

class DeviceStateController extends ParentState<DeviceState>{
  StateController notifier;
  NetworkManangerState networkManangerState;
  DeviceStateController(
     this.notifier, 
     this.networkManangerState
  ) : super(notifier);


  @override
  DeviceState get state => notifier.state;
  @override
  set state(DeviceState state) => notifier.state = state;

  NetworkManangerState get networkManager => networkManangerState;


}
