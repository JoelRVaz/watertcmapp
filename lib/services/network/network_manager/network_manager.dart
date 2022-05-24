import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp/providers/auth_provider/auth_state.dart';
import 'package:watertcmapp/services/connection_service/connection_service.dart';
import 'package:watertcmapp/services/network/bluetooth_client.dart';
import 'package:watertcmapp/services/network/http_client.dart';
import 'package:watertcmapp/services/network/network_manager/network_manager_state.dart';
import 'package:watertcmapp/services/popup_service.dart';
import 'package:watertcmapp/services/platform_service.dart';

final networkManagerProvider = StateNotifierProvider<NetworkManagerNotifier, NetworkManangerState>((ref) {
  AuthState auth = ref.watch(authProvider);
  NetworkManangerState networkManangerState = NetworkManangerState(
    httpClient: HTTPclient(accessToken: auth.accessToken),
    bluetoothClient: BluetoothClient(bluetoothAcessTokens: auth.bluetothAcessTokens),
    lrAuth: auth,
    accessToken: auth.accessToken,
    bluetoothAcessToken: auth.accessToken,
  );

  return NetworkManagerNotifier(networkManangerState);
});

class NetworkManagerNotifier extends StateNotifier<NetworkManangerState> {

  bool isInternetAvailable (ConnectivityResult connection) => 
    locator<ConnectionService>().isInternet(connection);
  bool isWeb = locator<PlatformService>().isWeb();

  NetworkManagerNotifier(NetworkManangerState state) : super(state) {
    connectivityListener();
  }

  Connectivity connectivity = Connectivity();
  StreamSubscription? connectionListenner;

  void connectivityListener() async {
    connectionListenner = !isWeb ? connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      print("=======================");
      print(result);
      print("is connected to internet: " + isInternetAvailable(result).toString());
  
      if(!isInternetAvailable(result) && state.httpConnection != false) {
        locator<PopUpService>().customAlertDialog(
          title: result.toString()
        );
      }
      state = state.update(httpConnection: isInternetAvailable(result));
      state = state.update(bluetoothConnection: (result == ConnectivityResult.bluetooth));
    }) : null;
  }



  Future<bool> isWifiAvailable() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi;
  }

    Future<String> connection() async {
    ConnectivityResult connection = await Connectivity().checkConnectivity();
    return connection.name;
  }

  void updatehttpClient({required String accessToken}) {
    state = state.update(httpClient: HTTPclient(accessToken: accessToken));
  }

  @override
  void dispose() {
    super.dispose();
    connectionListenner?.cancel();
  }
}
