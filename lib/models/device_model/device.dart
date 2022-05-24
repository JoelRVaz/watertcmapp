
import 'package:equatable/equatable.dart';
import 'package:watertcmapp/models/device_model/io_models/sensor.dart';
import 'package:watertcmapp/models/device_model/io_models/actuator.dart';

// ignore: must_be_immutable
class Device extends Equatable{
  String serial;
  final bool isConnectedToCloud;
  final String status;
  final dynamic additionalInfo;
  final String location;
  final String macAddress;
  final String name;
  final String owner;


  Device(
      {this.serial = '',
      this.isConnectedToCloud = true,
      this.status = '',
      this.additionalInfo = '',
      this.location = '',
      this.name = '',
      this.owner = '',
      this.macAddress = '',
});

  factory Device.fromJson(dynamic json) {
    var sensorList = json['sensors'] ?? [] ;
    var actuatorList = json['actuators'] ?? [] ;
    sensorList =
        sensorList.map<Sensor>((sensor) => Sensor.fromJson(sensor)).toList();
    actuatorList = actuatorList
        .map<Actuator>((actuator) => Actuator.fromJson(actuator))
        .toList();

    return Device(
      serial: json['serial'] ?? '',
      isConnectedToCloud: json['isConnectedToCloud'] ?? false ,
      status: json['status'] ?? '',
      additionalInfo: json['additionalInfo'] ?? '',
      macAddress: json['macAddress'] ?? '',
      location: json['location'] ?? '',
      name: json['name'] ?? '',
      owner: json['owner'] ?? '',
    );
  }

  @override
  String toString() {
    return '{ $serial, $name }';
  }

  @override
  List<Object> get props => [serial];
}
