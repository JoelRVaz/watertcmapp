import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:watertcmapp/constants/tests/backend.dart';
import 'package:watertcmapp/services/network/http_client.dart';
import 'package:watertcmapp/models/device_model/device.dart';
import 'package:watertcmapp/models/user_model/user.dart';



class HTTPdeviceCommands {
  HTTPclient httpClient;
  HTTPdeviceCommands(this.httpClient);


  Future<User> getUser() async {
    Response response = await httpClient.get(path: '/api/client/getUser');
    print(response.data);
    return User.fromJson(response.data);
  }


  Future<Device> registerDevice(String serial) async {
    final queryParameters = {
      'serial': serial,
      'schemaName': 'abcd'
    };
    Response device =
        await httpClient.post(path: '/api/device/registerDevice', data: queryParameters);
    return Device.fromJson(device.data);
  }

  void register(
      {required firstName,
      required lastName,
      required email,
      required password,
      required companyName}) async {
    // ignore: unused_local_variable
    User account = await getUser();
    final queryParameters = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'companyName': companyName
    };
    await httpClient.post(path: '/api/client/createClientDomain', data: queryParameters);
  }


  Future<Device> getDevice(String serial) async {
    await Future.delayed(const Duration(seconds: 1));
    var device = jsonDecode(singleDevice);
    Device deviceObj = Device.fromJson(device);
    deviceObj.serial = serial;
    return deviceObj;
  }

  Future<bool> awsConnectionTest() async {
    var respone = await httpClient.get(path: '/api/test3');
    print((respone.data == "hello") ? 
      "AWS connection test passed" : "connection to AWS failed");
    return respone.data == "hello";
  }


  Future<List<Device>> getDevices() async {
    User account = await getUser();
    final queryParameters = {'user': account.accountName};
    Response devices =
        await httpClient.get(path: '/api/device/showDevice', params: queryParameters);
    print(devices.data);
    List<Device> deviceList =
        devices.data.map<Device>((device) => Device.fromJson(device)).toList();
     return deviceList;
  }

  void dispose() {
    
  }
}
