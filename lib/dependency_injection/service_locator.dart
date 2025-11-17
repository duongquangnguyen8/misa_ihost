import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';


final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Register Dio
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: "https://api.example.com",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    // Add interceptors here if needed
    return dio;
  });

  // Register Repository
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(sl<Dio>()),
  // );
}