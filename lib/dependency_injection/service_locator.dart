import 'package:get_it/get_it.dart';
import 'package:misa_ihost/config/dio/dio_client.dart';
import 'package:misa_ihost/core/constans/api_paths.dart';
import 'package:misa_ihost/repository/auth_repo/auth_repo.dart';
import 'package:misa_ihost/repository_impl/auth_impl/auth_repo_impl.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Register Dio
  sl.registerLazySingleton<DioClient>(() {
    return DioClient(isCheckToken: true, baseUrl: ApiPaths.baseUrl);
  });

  //register auth_repository
  sl.registerSingleton<AuthRepo>(AuthRepoImpl(dioClient: sl<DioClient>()));
  
}
