import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;
  static init()
  {
    dio = Dio(
        BaseOptions(
          receiveDataWhenStatusError: true,
          baseUrl: 'https://student.valuxapps.com/api/',
        )
    );
  }

}