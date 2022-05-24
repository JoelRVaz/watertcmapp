
import 'dart:convert';

class IOdevice {
  final String serial;
  final String port;
  final String status;
  final dynamic additionalInfo;
  final String ioType;
  final String name;
  final String type;
  final String measurementType; 
  final Map<String,String> data;

  IOdevice({
    this.serial = '', 
    this.port = '',
    this.status = '',
    this.additionalInfo = '',
    this.ioType = '',
    this.name = '',
    this.type = '',
    this.measurementType = '',
    this.data = const {} 
  });

  factory IOdevice.fromJson(dynamic json) {
    return IOdevice(
      serial :json['serial'] as String, 
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
    return '{ $serial, $this.data }';
  }
}