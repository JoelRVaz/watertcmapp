import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';

final refresherProvider = StateNotifierProvider.autoDispose<RefresherNotifier, bool>((ref) {
  return RefresherNotifier(ref);
});

final scanProvider = StateProvider.autoDispose<DeviceNotifier>((ref) {
  final device = ref.watch(deviceProvider.notifier);
  return device;
});

class RefresherNotifier extends StateNotifier<bool> {
  // ignore: prefer_typing_uninitialized_variables
  final ref;
  bool httpRefreshEnabled = false;
  bool bluetoothRefreshEnabled = false;

  RefresherNotifier(this.ref) : super(true);

  void disableRefreshAll() {
    httpRefreshEnabled = false;
    bluetoothRefreshEnabled = false;
    state = false;
  }

  void refreshScan() {
    ref.refresh(scanProvider);
  }
}
