import 'package:dio/dio.dart';
import 'package:flutter_dio_getx/service/dio.helper.dart';

class ApiClient {
  Future getData(String path) async {
    try {
      final response =
          await Dio(BaseOptions(baseUrl: ApiConst.baseUrl)).get(path);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future getDetailUser(String path) async {
    try {
      final response =
          await Dio(BaseOptions(baseUrl: ApiConst.baseUrl)).get(path);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  
}
