// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:watertcmapp/constants/backend_config.dart';

class HTTPclient extends ChangeNotifier {
  
  String accessToken;
  HTTPclient({required this.accessToken});

//TODO find the reason for bad stat error when uncommenting line 14 and 15
  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    // connectTimeout: 5000,
    // receiveTimeout: 3000,
  ));

  Future<Response> get(
      {Map<String, dynamic> params = const {}, String path = ''}) async {
    print(path);
    print(accessToken);

    try {
      Response response = await dio.get(path,
          queryParameters: params,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
            'Authorization': 'Basic $accessToken',
          }));
      bool isSuccess =
          response.statusCode! >= 200 && response.statusCode! < 230;
      if (!isSuccess) {
        print(response.statusCode);
        throw response;
      }
      return response;
    } on DioError catch (e) {
      throw e.response!.data;
    }
  }

  Future<Response> post({
    Map<String, dynamic>? data,
    String path = ''
  }) async {
    try {
      print("--------------");
      print(accessToken);
      Response response = await dio.post(path,
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Basic $accessToken',
        }
      )
    );

    bool isSuccess = response.statusCode! > 200 && response.statusCode! < 230;
    if (!isSuccess) {
      throw response;
    }
    return response;
    } on DioError catch (e) {
      throw e.response!;
    }
  }

}
