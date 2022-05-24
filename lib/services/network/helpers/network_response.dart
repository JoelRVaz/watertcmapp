import 'package:dio/dio.dart';

class NetworkResponse {
  bool success;
  Response data;
  NetworkResponse(this.success, this.data);
}