import 'package:dio/dio.dart';
import 'package:firstapp/modules/shop_app/cubit/states.dart';
import 'package:flutter/material.dart';

class DioHelper {

  static Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: false,
        headers: {
          'Content-Type' : 'application/json',
        },
      ),
    );
    print('dio object (API) has been created & defined');
  }

  static Future<Response> getDate({
    @required String url,
    @required Map<String, dynamic> query,
}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String path,
    Map<String, dynamic> query,
    String lang = 'ar',
    @required Map<String, dynamic> data,
}) async {
    dio.options.headers = <String, dynamic>{
      'lang' : lang,
    };

    return await dio.post(
      path,
      queryParameters: query,
      data: data,
    );
  }


}