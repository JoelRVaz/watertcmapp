import 'io_device.dart';

class Sensor extends IOdevice {
  Sensor(
      {serial,
      port,
      status,
      additionalInfo,
      ioType,
      name,
      type,
      measurementType,
      data})
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

  factory Sensor.fromJson(dynamic json) {
    print("--...");
    print(json);
    return Sensor(
      serial: json['serial'] ?? '' ,
      port: json['port'] ?? '' ,
      status: json['status'] ?? '' ,
      additionalInfo: json['additionalInfo'] ?? '' ,
      ioType: json['ioType'] ?? '' ,
      name: json['name'] ?? '' ,
      type: json['type'] ?? '' ,
      measurementType: json['measurementType'] ?? '' ,
      data: json['data'] ?? {"": ""} 
    );
  }

  @override
  String toString() {
    return '{ $serial, $type }';
  }
}
