import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:misa_ihost/helper/widget_helper.dart';
import 'package:misa_ihost/models/response_common.dart';
import 'package:misa_ihost/core/exceptions/api_exception.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;
  final bool isCheckToken;
  AppInterceptors({required this.dio, required this.isCheckToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Thêm token vào header
    // options.headers['Authorization'] = "Bearer ...";
    final token = "asdd"; // get local storage
    if (kDebugMode) {
      print("➡️ REQUEST: ${options.method} ${options.path}");
      print("Headers: ${options.headers}");
      print("Data: ${options.data}");
    }

    // Example condition to check if token should be added
    if (isCheckToken) {
      options.headers['Authorization'] = token;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log raw response

    if (kDebugMode) {
      print("⬅️ RESPONSE: ${response.statusCode} ${response.data}");
    }

    try {
      // If the API wraps responses in the ResponseCommon structure,
      // parse it and throw ApiException when the call isn't successful.
      if (response.data is Map<String, dynamic>) {
        //return responseCommon
        final wrapper = ResponseCommon.fromJson(
          response.data as Map<String, dynamic>,
          (json) => json,
        );

        if (!wrapper.isSuccess) {
          // Show toast message from API error
          WidgetHelper.showToastError(title: wrapper.message);

          // Convert API-level error to ApiException so callers can handle it
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              error: ApiException(wrapper.code, wrapper.message),
              response: response,
            ),
          );
          return;
        }

        // If success and Data exists, we can replace response.data with Data payload
        // so downstream code gets the inner Data directly.
        if (wrapper.data != null) {
          response.data = wrapper.data;
        }
      }
    } catch (e) {
      // If parsing fails, continue with original response
      print('Response parsing error: $e');
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Map DioException to ApiException for consistency
    // Nếu có response trả về từ server
    if (err.response != null) {
      debugPrint('📡 STATUS CODE: ${err.response?.statusCode}');
      debugPrint('📦 RESPONSE DATA: ${err.response?.data}');
    } else {
      debugPrint('⚠️ No response received from server.');
    }

    //show Toast Error
    WidgetHelper.showToastError(title: err.message);

    if (err.error is ApiException) {
      // already mapped
      handler.next(err);
      return;
    }

    // Example mapping: timeout, network, response status
    final status = err.response?.statusCode;
    final message = err.message ?? 'Unexpected network error';

    final apiEx = ApiException(status, message);

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: apiEx,
        response: err.response,
        type: err.type,
      ),
    );
  }
}
