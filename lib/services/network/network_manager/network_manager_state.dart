import 'package:watertcmapp/providers/auth_provider/auth_state.dart';
import 'package:watertcmapp/services/network/bluetooth_client.dart';
import 'package:watertcmapp/services/network/http_client.dart';

class NetworkManangerState {
  HTTPclient httpClient;
  BluetoothClient bluetoothClient;
  bool httpConnection;
  bool bluetoothConnection;
  AuthState? lrAuth;
  String accessToken;
  String bluetoothAcessToken;


  NetworkManangerState({
    required this.httpClient,
    required this.bluetoothClient,
    this.httpConnection = false,
    this.bluetoothConnection = false,
    this.lrAuth,
    this.accessToken = '',
    this.bluetoothAcessToken = ''
  });


  NetworkManangerState update({
    HTTPclient? httpClient,
    BluetoothClient? bluetoothClient,
    bool? httpConnection,
    bool? bluetoothConnection,
    AuthState? lrAuth,
    String? accessToken,
    String? bluetoothAcessToken
  }) {
    return NetworkManangerState(
      httpClient: httpClient ?? this.httpClient, 
      bluetoothClient: bluetoothClient ?? this.bluetoothClient,
      httpConnection: httpConnection ?? this.httpConnection,
      lrAuth: lrAuth ?? this.lrAuth,
      accessToken: accessToken ?? this.accessToken,
      bluetoothAcessToken: bluetoothAcessToken ?? this.bluetoothAcessToken,
      bluetoothConnection: bluetoothConnection ?? this.bluetoothConnection
    );
  }
}
