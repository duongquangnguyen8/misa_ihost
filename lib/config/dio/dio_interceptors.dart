import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;
  final bool isCheckToken;
  AppInterceptors({required this.dio, required this.isCheckToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Thêm token vào header
    // options.headers['Authorization'] = "Bearer ...";
    final token="asdd"; // get local storage
    print("➡️ REQUEST: ${options.method} ${options.path}");
    print("Headers: ${options.headers}");
    print("Data: ${options.data}");
    
    // Example condition to check if token should be added
    if(isCheckToken){
      options.headers['Authorization'] = "$token";
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("⬅️ RESPONSE: ${response.statusCode} ${response.data}");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("❌ ERROR: ${err.type} -> ${err.message}");
    handler.next(err);
  }
}