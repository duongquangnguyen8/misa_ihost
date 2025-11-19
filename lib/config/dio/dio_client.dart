import 'package:dio/dio.dart';
import 'package:misa_ihost/config/dio/dio_interceptors.dart';
import 'package:misa_ihost/core/constans/api_paths.dart';

class DioClient {
  final Dio dio;

  DioClient._internal(this.dio);

  /// Create and configure a DioClient instance.
  ///
  /// [isCheckToken] - nếu true interceptor sẽ thêm token vào header (theo `AppInterceptors`).
  /// [baseUrl] - override base url nếu cần.
  factory DioClient({
    bool isCheckToken = true,
    String? baseUrl,
    Map<String, dynamic>? header,
  }) {
    final options = BaseOptions(
      baseUrl: baseUrl ?? ApiPaths.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      // Accept 2xx as success
      validateStatus: (status) =>
          status != null && status >= 200 && status < 300,
      responseType: ResponseType.json,
      headers:
          header ??
          {'Accept': 'application/json', 'Content-Type': 'application/json'},
    );

    final dio = Dio(options);

    // Add app-specific interceptor (token, logging, error mapping)
    dio.interceptors.add(AppInterceptors(dio: dio, isCheckToken: isCheckToken));

    // Add Dio's built-in logger for debugging (disable in production)
    // dio.interceptors.add(
    //   LogInterceptor(
    //     request: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     requestHeader: false,
    //   ),
    // );

    return DioClient._internal(dio);
  }

  /// Shortcut to create a raw Dio instance with default options (no interceptors).
  static Dio createDioRaw({String? baseUrl}) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ApiPaths.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
      ),
    );
  }

  Future<dynamic> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  /// Generic request wrapper
  Future<Response<T>> request<T>(
    String path, {
    required String method,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: (options ?? Options()).copyWith(method: method),
        cancelToken: cancelToken,
      );
    } on DioException {
      rethrow;
    }
  }
}
