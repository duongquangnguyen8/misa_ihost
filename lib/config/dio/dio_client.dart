import 'package:dio/dio.dart';
import 'package:misa_ihost/config/dio/dio_interceptors.dart';
import 'package:misa_ihost/core/constans/api_paths.dart';

class DioClient {
  final bool isCheckToken;
  DioClient({required this.isCheckToken});
  

  static Dio createDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ApiPaths.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (status) => status != null && status >= 200 && status < 300,
    );
    // dio.interceptors.add(AppInterceptors(dio:dio, isCheckToken: isCheckToken));
    // Add interceptors here if needed
    return dio;
  }
}
