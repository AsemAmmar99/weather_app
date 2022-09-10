import 'dart:io';

import 'package:dio/dio.dart';

import '../../../constants/constant_methods.dart';
import 'api_result_handler.dart';

class MyDio {
  static late Dio dio;

  static init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://api.weatherapi.com/v1/',
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
    );

    dio = Dio(baseOptions);
  }

  static Future<ApiResults> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    try {
      var response = await dio.get(endPoint, queryParameters: queryParameters);

      printResponse(response.statusCode.toString());
      printResponse('base:    ' + dio.options.baseUrl.toString());
      printResponse('url:    ' + endPoint.toString());
      printResponse('header:    ' + dio.options.headers.toString());
      printResponse('queryParameters:    ' + queryParameters.toString());
      printResponse('response:    ' + response.toString());
      return ApiSuccess(response.data, response.statusCode);
    } on SocketException {
      return ApiFailure("لا يوجد اتصال بالانترنت");
    } on FormatException {
      return ApiFailure("حدث خطأ في صيغة البيانات");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // print(e.message);
        // print('- - - - - - - - - - - - - - - -');
        // return ApiFailure(e.response!.data['message']);
        return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // print('check your connection');
        return ApiFailure("تأكد من اتصالك بالانترنت");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // print('unable to connect to the server');
        return ApiFailure("غير قادر علي الاتصال بالسيرفر");
      } else {
        return ApiFailure("حدث خطأ حاول مرة اخري");
      }
    } catch (e) {
      return ApiFailure("حدث خطأ حاول مرة اخري");
    }
  }
}
