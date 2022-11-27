import 'package:dio/dio.dart';
import 'package:salla_shop/core/enums/enum_toast_states.dart';
import 'package:salla_shop/core/helper_widgets/toast_messages.dart';
import 'package:salla_shop/core/helpers_classes/dio_error_helper.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    String lang = 'ar',
    String? baseUrl,
    String? token,
  }) async {
    dio.options.baseUrl = baseUrl ?? 'https://student.valuxapps.com/api/';
    dio.options.headers = headers ??
        {
          "lang": lang,
          "Authorization": token,
          "Content-Type": "application/json",
        };
    try {
      return await dio.get(
        url,
        queryParameters: query,
      );
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      ToastMessages.showToastMessage(
          msg: errorMessage, state: ToastStates.ERROR);
      throw errorMessage;
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
    String? baseUrl,
    Map<String, dynamic>? headers,
  }) async {
    dio.options.baseUrl = baseUrl ?? 'https://student.valuxapps.com/api/';
    dio.options.headers = headers ??
        {
          "lang": lang,
          "Authorization": token,
          "Content-Type": "application/json",
        };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
