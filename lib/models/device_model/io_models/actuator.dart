import 'dart:convert';

import 'io_device.dart';
class Actuator extends IOdevice {
  final dynamic output;

  Actuator(
      {serial,
      port,
      status,
      additionalInfo,
      ioType,
      name,
      type,
      measurementType,
      data,
      this.output})
      : super(
            serial: serial,
            port: port,
            status: status,
            additionalInfo: additionalInfo,
            ioType: ioType,
            name: name,
            type: type,
            measurementType: measurementType,
            data: data);

  factory Actuator.fromJson(dynamic json) {
    return Actuator(
        serial: json['serial'] as String,
        port: json['port'] as String,
        status: json['status'] as String,
        additionalInfo: json['additionalInfo'] as String,
        ioType: json['ioType'] as String,
        name: json['name'] as String,
        type: json['type'] as String,
        measurementType: json['measurementType'] as String,
        data : jsonDecode(json['data']) as Map<String, String>
      );
  }

  @override
  String toString() {
    return '{ $serial, $type }';
  }
}
